#!/bin/bash

releases=$(curl -s https://api.github.com/repos/mocaccinoOS/caramel/releases)

template=$(cat <<EOF
<div class="element box is-info px-1 m-3">
    <p class="title">%NAME%</p>
    <p class="subtitle">%CREATED%</p>
    <p><strong>%SIZE%</strong></p>

    <p>
        <a class="button is-link" href="%URL%" _target="blank" >
            <span class="icon">
                <i class="fas fa-download"></i> 
            </span>
            <span> Download </span>
        </a>
        <a class="button is-secondary" href="%URL%.sha256" _target="blank" >
            <span class="icon">
                <i class="fas fa-download"></i> 
            </span>
            <span> SHA </span>
        </a>
    </p>
<!--   <figure class="image is-4by3">
    <img src="https://bulma.io/images/placeholders/640x480.png">
    </figure> -->
</div>
EOF
)

TILES=
for i in $(echo $releases | jq '.[0].assets[] | select( .browser_download_url | contains("sha256") | not )' -cr); do

    name=$(echo "$i" | jq -r ".name")
    size=$(numfmt --to=iec-i <<< $(echo "$i" | jq -r ".size"))
    created_at=$(echo "$i" | jq -r ".created_at")
    url=$(echo "$i" | jq -r ".browser_download_url")

    echo "[${created_at}] Asset $name ($size): $url"

    TILES=${TILES}$(echo $template | \
        sed "s/\%NAME\%/$name/g" | \
        sed "s/\%SIZE\%/$size/g" | \
        sed "s/\%CREATED\%/$created_at/g" | \
        sed "s|\%URL\%|$url|g")
done

cat gallery.html.tmpl | sed "s|%TILES%|$TILES|g" > gallery.html