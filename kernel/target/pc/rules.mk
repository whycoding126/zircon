# Copyright 2016 The Fuchsia Authors
# Copyright (c) 2008-2015 Travis Geiselbrecht
#
# Use of this source code is governed by a MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT

LOCAL_DIR := $(GET_LOCAL_DIR)

MODULE := $(LOCAL_DIR)

PLATFORM := pc

MODULE_SRCS := $(LOCAL_DIR)/empty.cpp

MODULE_DEPS := \
    kernel/dev/intel_rng

include make/module.mk

# build kernel-bootdata for fuchisa build
KERNEL_BOOTDATA := $(BUILDDIR)/pc-kernel-bootdata.bin
$(KERNEL_BOOTDATA): $(MKBOOTFS)
	$(call BUILDECHO,generating $@)
	@$(MKDIR)
	$(NOECHO)$(MKBOOTFS) -o $@ --empty

kernel-only: $(KERNEL_BOOTDATA)
kernel: $(KERNEL_BOOTDATA)
