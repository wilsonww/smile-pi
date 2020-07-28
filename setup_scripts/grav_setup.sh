sudo apt-get --yes --allow-unauthenticated install php7.3-curl
sudo apt-get --yes --allow-unauthenticated install php7.3-gd
sudo apt-get --yes --allow-unauthenticated install php7.3-xml
sudo apt-get --yes --allow-unauthenticated install php7.3-zip
sudo apt-get --yes --allow-unauthenticated install php7.3-mbstring


# Create this script to update permissions

#!/bin/sh
chown -R www-data:www-data .
find . -type f -exec chmod 664 {} \;
find ./bin -type f -exec chmod 775 {} \;
find . -type d -exec chmod 775 {} \;
find . -type d -exec chmod +s {} \;


# add this to /etc/nginx/nginx.conf
# this tell nginx to find it in the subfolder 'grav' in /usr/share/nginx/html/grav

location /grav {
     try_files $uri $uri/ /grav/index.php?$query_string;
#    index  index.php;
}


# Install the File Browser Plug-in
# add a line to blueprints.yaml
  thumbnail_types: [png, jpg, jpeg, gif, pdf]

# Change file-browser.php to automatically show the Page Media
# Change this line:
$filesDir = isset($config["source"]) ? $config["source"] : "user://files";
# to this:
$filesDir = "user://pages/".$page->folder();


## Admin plugin
# need to rip out the atom rss feed and the notifications.


# need to bring in fontawesome locally
# download Fontawesome, put it into the /user/plugins/file-browser/css-compiled directory

{% if options["load_font_awesome"] %}
  {# Below kit provides the latest Font Awesome Free as webfonts #}
  {% do assets.addCss("plugins://file-browser/css-compiled/fontawesome-free-5.12.1-web/css/all.css") %}
{% endif %}
