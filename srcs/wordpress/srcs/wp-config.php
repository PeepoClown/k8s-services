<?php
/**
* The base configurations of the WordPress.
*
* This file has the following configurations: MySQL settings, Table Prefix,
* Secret Keys, WordPress Language, and ABSPATH. You can find more information
* by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
* wp-config.php} Codex page. You can get the MySQL settings from your web host.
*
* This file is used by the wp-config.php creation script during the
* installation. You don’t have to use the web site, you can just copy this file
* to “wp-config.php” and fill in the values.
*
* @package WordPress
*/

$_SERVER['HTTPS'] = 'off';

// ** MySQL settings – You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wupdegra');

/** MySQL database password */
define('DB_PASSWORD', '12345');

/** MySQL hostname */
define('DB_HOST', 'mysql-service:3306');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don’t change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
* Authentication Unique Keys and Salts.
*
* Change these to different unique phrases!
* You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
* You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
*
* @since 2.6.0
*/
/**#@-*/
define('AUTH_KEY',         'Psq75~lvWl%lPFF6n-x?PaZ4WJ`cGQQ5vl;`6>tYRfjf!G1WNL+~!j=O#/&%?Q4|');
define('SECURE_AUTH_KEY',  'N6[Zvi~i7c)`l2o0z_lVaWgCXg-=O_w+1|ZCsgrqCy<e@-@oeFuce}2c)tg(86i-');
define('LOGGED_IN_KEY',    'S*TPwR<3nzPtWCtO#C<*=m-vz60dYQ~AE98{Q;6LBt-9x.plu;#GA*,OOc?+G%-6');
define('NONCE_KEY',        '6|.cG^Yy-GngZIy&{-|%e_,m_DlE4> >euM-!l%rmSNzHXy#3VO{7k5elh4[izna');
define('AUTH_SALT',        'je+R(`!,+cClMIz)G^@f1QI$W.;jjX:q|lF{@qf2Fr/c$W-(tU 41yjO9zCng<)d');
define('SECURE_AUTH_SALT', 'LtPmZTV30e(UBTp{`v2p,F1cOz:n-[~2yJ~;.)53ui|}U|h/0{rL;tFvAguSiI3#');
define('LOGGED_IN_SALT',   '21|( ^!-y^&:y+wo?vVEu*(3N`M/,<15}{u,Ucg+tj_8?ms[DB<hRzIxIPzjj^Zm');
define('NONCE_SALT',       'Ao]Prn?zwp>,t,6-GCD:L#E&)W6dS/)9poQ^cg{Y|8$A1Ll}:S;@](qB6IL,FvPr');
/**
* WordPress Database Table prefix.
*
* You can have multiple installations in one database if you give each a unique
* prefix. Only numbers, letters, and underscores please!
*/
$table_prefix  = 'wp_';

/**
* For developers: WordPress debugging mode.
*
* Change this to true to enable the display of notices during development.
* It is strongly recommended that plugin and theme developers use WP_DEBUG
* in their development environments.
*/
define('WP_DEBUG', true);

/* That’s all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
