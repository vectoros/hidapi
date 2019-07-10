LOCAL_PATH:= $(call my-dir)

HIDAPI_ROOT_REL:= ../..
HIDAPI_ROOT_ABS:= $(LOCAL_PATH)/../..
# external/libusb/ path, please make sure libusb has been add to PRODUCT_PACKAGES
# if not, you can modify build/make/target/product/base.mk
LIBUSB_ABS:= $(LOCAL_PATH)/../../../libusb

include $(CLEAR_VARS)

# add flags to avoid make failed.
LOCAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-parameter -Wno-error=return-type

LOCAL_SRC_FILES := \
  $(HIDAPI_ROOT_REL)/libusb/hid.c

LOCAL_C_INCLUDES += \
  $(HIDAPI_ROOT_ABS)/hidapi \
  $(LIBUSB_ABS)/libusb \
  $(HIDAPI_ROOT_ABS)/android

# libusb in external/libusb/ does not have suffix -1.0
LOCAL_SHARED_LIBRARIES := libusb

LOCAL_MODULE := libhidapi

include $(BUILD_SHARED_LIBRARY)
