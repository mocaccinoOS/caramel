#!/bin/bash

releases=$(curl -s https://api.github.com/repos/mocaccinoOS/caramel/releases)

declare -A app_logos=( 
    ["balsa"]="https://pawsa.fedorapeople.org/balsa/images/balsa.jpg"
    ["clamtk"]="https://upload.wikimedia.org/wikipedia/commons/c/c1/Clamtk_logo.png" 
    ["firefox"]="https://upload.wikimedia.org/wikipedia/commons/a/a0/Firefox_logo%2C_2019.svg"
    ["gimp"]="https://www.gimp.org/images/frontpage/wilber-big.png"
    ["chrome"]="https://www.google.com/chrome/static/images/chrome-logo.svg"
    ["inkscape"]="https://media.inkscape.org/static/images/inkscape-logo.svg"
    ["kodi"]="https://kodi.tv/images/kodi-logo-with-text.svg"
    ["libreoffice"]="https://it.libreoffice.org/themes/libreofficenew/img/logo.png"
    ["lutris"]="https://lutris.net/static/images/logo.a2f1036fd4ea.png"
    ["pidgin"]="https://www.pidgin.im/images/logo.png"
    ["r-studio"]=""
    ["shotcut"]="https://shotcut.org/assets/img/shotcut-logo2.png"
    ["skype"]="https://secure.skypeassets.com/content/dam/scom/legal/brand-guidelines/skype-icon.svg"
    ["slack"]="https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/2019-01_BrandRefresh_slack-brand-refresh_header-1.png"
    ["snap"]="https://assets.ubuntu.com/v1/7f93bb62-snapcraft-logo--web-white-text.svg"
    ["teams"]="https://download.logo.wine/logo/Microsoft_Teams/Microsoft_Teams-Logo.wine.png"
    ["teamviewer"]="https://www.teamviewer.com/wp-content/themes/tv-wordpress-theme/dist/media/TeamViewer_Company_RGB.svg"
    ["thunderbird"]="https://upload.wikimedia.org/wikipedia/commons/e/e1/Thunderbird_Logo%2C_2018.svg"
    ["vlc"]="https://upload.wikimedia.org/wikipedia/commons/3/38/VLC_icon.png"
    ["zoom"]="https://st1.zoom.us/static/5.2.3509/image/new/ZoomLogo.png"
)

declare -A app_link=( 
    ["balsa"]="https://pawsa.fedorapeople.org/balsa/" 
    ["clamtk"]="https://gitlab.com/dave_m/clamtk/"
    ["firefox"]="https://www.mozilla.org/"
    ["gimp"]="https://www.gimp.org/"
    ["chrome"]="https://www.google.com/intl/en_us/chrome/"
    ["inkscape"]="https://inkscape.org/"
    ["kodi"]="https://kodi.tv"
    ["libreoffice"]="https://libreoffice.org/"
    ["lutris"]="https://lutris.net/"
    ["pidgin"]="https://www.pidgin.im/"
    ["r-studio"]="https://www.rstudio.com/"
    ["shotcut"]="https://shotcut.org/"
    ["skype"]="https://www.skype.com/"
    ["slack"]="https://slack.com/"
    ["snap"]="https://snapcraft.io/"
    ["teams"]="https://www.microsoft.com/en-us/microsoft-teams/download-app"
    ["teamviewer"]="https://www.teamviewer.com/"
    ["thunderbird"]="https://www.thunderbird.net/"
    ["vlc"]="https://www.videolan.org/vlc/"
    ["zoom"]="https://zoom.us/"
)

template=$(cat <<EOF
<div class="element box has-background-grey-light has-text-light px-1 m-3">
    <center><a href="%LINK%" target=_blank><img src="%LOGO%" width=120></a></center>
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

    link=
    logo=

    for distro in "${!app_logos[@]}"; do 
   # echo "$distro - ${app_logos[$distro]}"; 
        if [[ $name =~ $distro* ]]; then
            logo=${app_logos[$distro]}
        fi
    done
    for distro in "${!app_link[@]}"; do 
        if [[ $name =~ $distro* ]]; then
            link=${app_link[$distro]}
        fi
    done

    echo "[${created_at}] Asset $name ($size): $url. Logo $logo link $link"

    TILES=${TILES}$(echo $template | \
        sed "s/\%NAME\%/$name/g" | \
        sed "s/\%SIZE\%/$size/g" | \
        sed "s|\%LINK\%|$link|g" | \
        sed "s|\%LOGO\%|$logo|g" | \
        sed "s/\%CREATED\%/$created_at/g" | \
        sed "s|\%URL\%|$url|g")
done

cat gallery.html.tmpl | sed "s|%TILES%|$TILES|g" > gallery.html