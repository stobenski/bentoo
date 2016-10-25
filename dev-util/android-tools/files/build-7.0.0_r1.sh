clang++ -o core/adb/adb.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb.cpp
clang++ -o core/adb/adb_auth.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_auth.cpp
clang++ -o core/adb/adb_io.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_io.cpp
clang++ -o core/adb/adb_listeners.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_listeners.cpp
clang++ -o core/adb/adb_trace.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_trace.cpp
clang++ -o core/adb/adb_utils.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_utils.cpp
clang++ -o core/adb/line_printer.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/line_printer.cpp
clang++ -o core/adb/sockets.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/sockets.cpp
clang++ -o core/adb/transport.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/transport.cpp
clang++ -o core/adb/transport_local.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/transport_local.cpp
clang++ -o core/adb/transport_usb.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/transport_usb.cpp
clang++ -o core/adb/sysdeps_unix.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/sysdeps_unix.cpp
clang++ -o core/adb/fdevent.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/fdevent.cpp
clang++ -o core/adb/get_my_path_linux.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/get_my_path_linux.cpp
clang++ -o core/adb/usb_linux.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/usb_linux.cpp
clang++ -o core/adb/adb_auth_host.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_auth_host.cpp
clang++ -o core/adb/shell_service_protocol.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_REVISION=\"$PKGVER\" -DADB_HOST=1 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/shell_service_protocol.cpp
clang++ -o core/adb/console.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/console.cpp
clang++ -o core/adb/commandline.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/commandline.cpp
clang++ -o core/adb/adb_client.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/adb_client.cpp
clang++ -o core/adb/services.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/services.cpp
clang++ -o core/adb/file_sync_client.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/file_sync_client.cpp
clang++ -o core/adb/client/main.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -DADB_HOST=1 -DWORKAROUND_BUG6558362 -fpermissive -Icore/include -Icore/base/include -Icore/adb -c core/adb/client/main.cpp
clang++ -o core/base/file.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/file.cpp
clang++ -o core/base/logging.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/logging.cpp
clang++ -o core/base/parsenetaddress.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/parsenetaddress.cpp
clang++ -o core/base/stringprintf.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/stringprintf.cpp
clang++ -o core/base/strings.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/strings.cpp
clang++ -o core/base/errors_unix.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DADB_HOST=1 -Icore/base/include -Icore/include -c core/base/errors_unix.cpp
clang -o core/liblog/log_event_write.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/log_event_write.c
clang -o core/liblog/fake_log_device.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/fake_log_device.c
clang -o core/liblog/log_event_list.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/log_event_list.c
clang -o core/liblog/logger_write.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/logger_write.c
clang -o core/liblog/config_write.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/config_write.c
clang -o core/liblog/logger_lock.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/logger_lock.c
clang -o core/liblog/fake_writer.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/fake_writer.c
clang -o core/liblog/logger_name.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DLIBLOG_LOG_TAG=1005 -DFAKE_LOG_DEVICE=1 -D_GNU_SOURCE -Icore/log/include -Icore/include -c core/liblog/logger_name.c
clang -o core/libcutils/load_file.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/load_file.c
clang -o core/libcutils/socket_local_client_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_local_client_unix.c
clang -o core/libcutils/socket_loopback_client_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_loopback_client_unix.c
clang -o core/libcutils/socket_network_client_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_network_client_unix.c
clang -o core/libcutils/socket_loopback_server_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_loopback_server_unix.c
clang -o core/libcutils/socket_local_server_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_local_server_unix.c
clang++ -o core/libcutils/sockets_unix.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/sockets_unix.cpp
clang -o core/libcutils/socket_inaddr_any_server_unix.c.o -std=gnu11 $CFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/socket_inaddr_any_server_unix.c
clang++ -o core/libcutils/sockets.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -D_GNU_SOURCE -Icore/include -c core/libcutils/sockets.cpp
clang++ -o core/adb/diagnose_usb.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -Icore/include -Icore/base/include -c core/adb/diagnose_usb.cpp
g++ -o adb -lrt -ldl -lpthread -lcrypto $LDFLAGS core/base/file.cpp.o core/base/logging.cpp.o core/base/parsenetaddress.cpp.o core/base/stringprintf.cpp.o core/base/strings.cpp.o core/base/errors_unix.cpp.o core/liblog/log_event_write.c.o core/liblog/fake_log_device.c.o core/liblog/log_event_list.c.o core/liblog/logger_write.c.o core/liblog/config_write.c.o core/liblog/logger_lock.c.o core/liblog/fake_writer.c.o core/liblog/logger_name.c.o core/libcutils/load_file.c.o core/libcutils/socket_local_client_unix.c.o core/libcutils/socket_loopback_client_unix.c.o core/libcutils/socket_network_client_unix.c.o core/libcutils/socket_loopback_server_unix.c.o core/libcutils/socket_local_server_unix.c.o core/libcutils/sockets_unix.cpp.o core/libcutils/socket_inaddr_any_server_unix.c.o core/libcutils/sockets.cpp.o core/adb/adb.cpp.o core/adb/adb_auth.cpp.o core/adb/adb_io.cpp.o core/adb/adb_listeners.cpp.o core/adb/adb_trace.cpp.o core/adb/adb_utils.cpp.o core/adb/line_printer.cpp.o core/adb/sockets.cpp.o core/adb/transport.cpp.o core/adb/transport_local.cpp.o core/adb/transport_usb.cpp.o core/adb/sysdeps_unix.cpp.o core/adb/fdevent.cpp.o core/adb/get_my_path_linux.cpp.o core/adb/usb_linux.cpp.o core/adb/adb_auth_host.cpp.o core/adb/shell_service_protocol.cpp.o core/adb/console.cpp.o core/adb/commandline.cpp.o core/adb/adb_client.cpp.o core/adb/services.cpp.o core/adb/file_sync_client.cpp.o core/adb/client/main.cpp.o core/adb/diagnose_usb.cpp.o
clang++ -o core/fastboot/protocol.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/protocol.cpp
clang++ -o core/fastboot/engine.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/engine.cpp
clang++ -o core/fastboot/bootimg_utils.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/bootimg_utils.cpp
clang++ -o core/fastboot/fastboot.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/fastboot.cpp
clang++ -o core/fastboot/util.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/util.cpp
clang++ -o core/fastboot/fs.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/fs.cpp
clang++ -o core/fastboot/usb_linux.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/usb_linux.cpp
clang++ -o core/fastboot/util_linux.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/util_linux.cpp
clang++ -o core/fastboot/socket.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/socket.cpp
clang++ -o core/fastboot/tcp.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/tcp.cpp
clang++ -o core/fastboot/udp.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -DFASTBOOT_REVISION=\"$PKGVER\" -D_GNU_SOURCE -Icore/base/include -Icore/include -Icore/adb -Icore/libsparse/include -Icore/mkbootimg -Iextras/ext4_utils -Iextras/f2fs_utils -c core/fastboot/udp.cpp
clang -o core/libsparse/backed_block.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/backed_block.c
clang -o core/libsparse/output_file.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/output_file.c
clang -o core/libsparse/sparse.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/sparse.c
clang -o core/libsparse/sparse_crc32.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/sparse_crc32.c
clang -o core/libsparse/sparse_err.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/sparse_err.c
clang -o core/libsparse/sparse_read.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -c core/libsparse/sparse_read.c
clang++ -o core/libziparchive/zip_archive.cc.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -Icore/base/include -Icore/include -c core/libziparchive/zip_archive.cc
clang++ -o core/libutils/FileMap.cpp.o -std=gnu++14 $CXXFLAGS $CPPFLAGS -Icore/include -c core/libutils/FileMap.cpp
clang -o extras/ext4_utils/make_ext4fs.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/make_ext4fs.c
clang -o extras/ext4_utils/ext4fixup.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/ext4fixup.c
clang -o extras/ext4_utils/ext4_utils.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/ext4_utils.c
clang -o extras/ext4_utils/allocate.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/allocate.c
clang -o extras/ext4_utils/contents.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/contents.c
clang -o extras/ext4_utils/extent.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/extent.c
clang -o extras/ext4_utils/indirect.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/indirect.c
clang -o extras/ext4_utils/sha1.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/sha1.c
clang -o extras/ext4_utils/wipe.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/wipe.c
clang -o extras/ext4_utils/crc16.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/crc16.c
clang -o extras/ext4_utils/ext4_sb.c.o -std=gnu11 $CFLAGS $CPPFLAGS -Icore/libsparse/include -Icore/include -Ilibselinux/include -c extras/ext4_utils/ext4_sb.c
clang -o libselinux/src/callbacks.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/callbacks.c
clang -o libselinux/src/check_context.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/check_context.c
clang -o libselinux/src/freecon.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/freecon.c
clang -o libselinux/src/init.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/init.c
clang -o libselinux/src/label.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/label.c
clang -o libselinux/src/label_file.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/label_file.c
clang -o libselinux/src/label_android_property.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/label_android_property.c
clang -o libselinux/src/label_support.c.o -std=gnu11 $CFLAGS $CPPFLAGS -DAUDITD_LOG_TAG=1003 -D_GNU_SOURCE -DHOST -Ilibselinux/include -c libselinux/src/label_support.c
g++ -o fastboot -lz -lpcre -lpthread $LDFLAGS core/libsparse/backed_block.c.o core/libsparse/output_file.c.o core/libsparse/sparse.c.o core/libsparse/sparse_crc32.c.o core/libsparse/sparse_err.c.o core/libsparse/sparse_read.c.o core/libziparchive/zip_archive.cc.o core/libcutils/load_file.c.o core/libcutils/socket_local_client_unix.c.o core/libcutils/socket_loopback_client_unix.c.o core/libcutils/socket_network_client_unix.c.o core/libcutils/socket_loopback_server_unix.c.o core/libcutils/socket_local_server_unix.c.o core/libcutils/sockets_unix.cpp.o core/libcutils/socket_inaddr_any_server_unix.c.o core/libcutils/sockets.cpp.o core/liblog/log_event_write.c.o core/liblog/fake_log_device.c.o core/liblog/log_event_list.c.o core/liblog/logger_write.c.o core/liblog/config_write.c.o core/liblog/logger_lock.c.o core/liblog/fake_writer.c.o core/liblog/logger_name.c.o core/libutils/FileMap.cpp.o core/base/file.cpp.o core/base/logging.cpp.o core/base/parsenetaddress.cpp.o core/base/stringprintf.cpp.o core/base/strings.cpp.o core/base/errors_unix.cpp.o extras/ext4_utils/make_ext4fs.c.o extras/ext4_utils/ext4fixup.c.o extras/ext4_utils/ext4_utils.c.o extras/ext4_utils/allocate.c.o extras/ext4_utils/contents.c.o extras/ext4_utils/extent.c.o extras/ext4_utils/indirect.c.o extras/ext4_utils/sha1.c.o extras/ext4_utils/wipe.c.o extras/ext4_utils/crc16.c.o extras/ext4_utils/ext4_sb.c.o libselinux/src/callbacks.c.o libselinux/src/check_context.c.o libselinux/src/freecon.c.o libselinux/src/init.c.o libselinux/src/label.c.o libselinux/src/label_file.c.o libselinux/src/label_android_property.c.o libselinux/src/label_support.c.o core/fastboot/protocol.cpp.o core/fastboot/engine.cpp.o core/fastboot/bootimg_utils.cpp.o core/fastboot/fastboot.cpp.o core/fastboot/util.cpp.o core/fastboot/fs.cpp.o core/fastboot/usb_linux.cpp.o core/fastboot/util_linux.cpp.o core/fastboot/socket.cpp.o core/fastboot/tcp.cpp.o core/fastboot/udp.cpp.o core/adb/diagnose_usb.cpp.o
