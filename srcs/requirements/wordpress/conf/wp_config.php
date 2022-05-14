<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', getenv(WP_ADMIN_USR) );

/** MySQL database password */
define( 'DB_PASSWORD', getenv(WP_ADMIN_PWD) );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '!w+U%;?shJZkOqj5tqwEWVvyJ.r{cg[t57s]V8#W)No|f6g}Bma~d|5hCIvp,{_=' );
define( 'SECURE_AUTH_KEY',  'Kr1v-s0)8wIHi[fcNv_hAxcks41gn!;]- zM[?MdorsBYg[En1wry(Chk;ZTlz9{' );
define( 'LOGGED_IN_KEY',    'vOv2U5rw Qb.<]5E>3=zhWcWAkhF%}-t(g7BWiq0PfM>~ExO/E1{VI4`lU78Q)m%' );
define( 'NONCE_KEY',        'kpx@AN(ZzR*[.,S*|rP?YWg>UHYvexJ6Z{([ti7tm%* qF~i0!.*0Hn[5xTPl<qG' );
define( 'AUTH_SALT',        '2l+kjOE{l0|$|fP|xW619IZ*BcAasOZa]mZ1/NT~AzuJ8S6gNP5bJaS6l?w)_De<' );
define( 'SECURE_AUTH_SALT', 'UeLhS3~Dc)n2Qgo.<?pie.*1!5[IcVF9bT+F!`q^]?9P$;4T4%9Dba)z?zt[1#lg' );
define( 'LOGGED_IN_SALT',   ' ANmihrUr^CO@Otf Haq$8$vGPBc(qdAIS[D_1eJKQ[TO6HprxBA-|oZ6@+wjoos' );
define( 'NONCE_SALT',       '@ gN&2>*:;>*:9SA(B!p>uR 6]9DoA4dwpR QWA Knn-jEzJS]~hf]SWZFZ[`RCZ' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';