## Overview

[![CI](https://github.com/silverstripe/silverstripe-installer/actions/workflows/ci.yml/badge.svg)](https://github.com/silverstripe/silverstripe-installer/actions/workflows/ci.yml)
[![Silverstripe supported module](https://img.shields.io/badge/silverstripe-supported-0071C4.svg)](https://www.silverstripe.org/software/addons/silverstripe-commercially-supported-module-list/)

Base project folder for a Silverstripe ([http://silverstripe.org](http://silverstripe.org)) installation. Required modules are installed via [http://github.com/silverstripe/recipe-cms](http://github.com/silverstripe/recipe-cms). For information on how to change the dependencies in a recipe, please have a look at [https://github.com/silverstripe/recipe-plugin](https://github.com/silverstripe/recipe-plugin). In addition, installer includes [theme/simple](https://github.com/silverstripe-themes/silverstripe-simple) as a default theme.

## Installation

1. Clone the Repository
- Open your terminal or command prompt and navigate to the directory where you want to install the project. Then run:
```sh
git clone https://github.com/pranjalpc99/trainor-assignment.git
```

2. Navigate to the Project Directory
```sh
cd trainor-assignment
```

3. Install Dependencies
- Use Composer to install all project dependencies:
```sh
composer install
```

4. Start your web server
- Install Apache via Homebrew
```sh
brew install httpd
```
- Edit the httpd.conf File
```
code /opt/homebrew/etc/httpd/httpd.conf  
```
- Change `Listen` to port `80`
- Look for `IfModule` and replace
```sh
<IfModule dir_module>
    DirectoryIndex index.html
</IfModule>
```
with
```sh
<IfModule !mpm_prefork_module>
	#LoadModule cgid_module lib/httpd/modules/mod_cgid.so
</IfModule>
<IfModule mpm_prefork_module>
	#LoadModule cgi_module lib/httpd/modules/mod_cgi.so
</IfModule>
```
- Add this line to use php
```sh
LoadModule php_module /opt/homebrew/opt/php@8.2/lib/httpd/modules/libphp.so
```
- Update User and Group
```sh
User <your_username>
Group staff
```

- Change Servername to `localhost`
- Update DocumentRoot to point to your working directory, example: 
```sh
DocumentRoot "/Users/your_username/path/to/your-project/public"
```
- Just below that line update Directory:
```sh
<Directory "/Users/your_username/path/to/your-project/public">
```

6. In `.env` file you might have to change the `SS_DATABASE_USERNAME` with your system username.

7. Start Apache
```sh
brew services start httpd
```

8. Run the Database Build Task
- Navigate to `http://localhost/dev/build?flush=all` in your browser.

9. Run the application
- Vist `http://localhost` or the domain you configured

# Access the CMS
To access the SilverStripe CMS admin interface, navigate to:
```sh
http://localhost/admin
```
Log in using the default admin credentials you set in the .env file:
- Username: admin
- Password: password

## Note
To set the hero image (of the gentleman on the page), I have added a few images to the assets folder in the project.


## Development and Contribution

If you would like to make changes to the Silverstripe core codebase, we have an extensive [guide to contributing code](https://docs.silverstripe.org/en/contributing/code/).

## Links

 * [Changelogs](https://docs.silverstripe.org/en/changelogs/)
 * [Bugtracker: Framework](https://github.com/silverstripe/silverstripe-framework/issues)
 * [Bugtracker: CMS](https://github.com/silverstripe/silverstripe-cms/issues)
 * [Bugtracker: Installer](https://github.com/silverstripe/silverstripe-installer/issues)
 * [Forums](http://silverstripe.org/forums)
 * [Developer Mailinglist](https://groups.google.com/forum/#!forum/silverstripe-dev)
 * [License](./LICENSE)
