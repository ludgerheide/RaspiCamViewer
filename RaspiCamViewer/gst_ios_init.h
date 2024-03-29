#ifndef __GST_IOS_INIT_H__
#define __GST_IOS_INIT_H__

#include <gst/gst.h>

G_BEGIN_DECLS

/* Uncomment each line to enable the plugin categories that your application needs.
 * You can also enable individual plugins. See gst_ios_init.c to see their names
 */

#define GST_IOS_PLUGINS_CORE
#define GST_IOS_PLUGINS_CAPTURE
#define GST_IOS_PLUGINS_CODECS_RESTRICTED
#define GST_IOS_PLUGINS_ENCODING
//#define GST_IOS_PLUGINS_CODECS_GPL
#define GST_IOS_PLUGINS_NET_RESTRICTED
#define GST_IOS_PLUGINS_SYS
#define GST_IOS_PLUGINS_VIS
#define GST_IOS_PLUGINS_PLAYBACK
#define GST_IOS_PLUGINS_EFFECTS
//#define GST_IOS_PLUGINS_CODECS
#define GST_IOS_PLUGINS_NET
#define GST_IOS_PLUGINS_EDITING


#define GST_IOS_GIO_MODULE_GNUTLS

void gst_ios_init ();

G_END_DECLS

#endif