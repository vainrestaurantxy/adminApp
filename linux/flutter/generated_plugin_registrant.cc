//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_saver/file_saver_plugin.h>
#include <file_selector_linux/file_selector_plugin.h>
#include <qr_bar_code/qr_bar_code_plugin.h>
#include <smart_auth/smart_auth_plugin.h>
#include <smart_text_search/smart_text_search_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) file_saver_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSaverPlugin");
  file_saver_plugin_register_with_registrar(file_saver_registrar);
  g_autoptr(FlPluginRegistrar) file_selector_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSelectorPlugin");
  file_selector_plugin_register_with_registrar(file_selector_linux_registrar);
  g_autoptr(FlPluginRegistrar) qr_bar_code_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "QrBarCodePlugin");
  qr_bar_code_plugin_register_with_registrar(qr_bar_code_registrar);
  g_autoptr(FlPluginRegistrar) smart_auth_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartAuthPlugin");
  smart_auth_plugin_register_with_registrar(smart_auth_registrar);
  g_autoptr(FlPluginRegistrar) smart_text_search_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartTextSearchPlugin");
  smart_text_search_plugin_register_with_registrar(smart_text_search_registrar);
}
