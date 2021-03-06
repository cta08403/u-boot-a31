/*
 * (C) Copyright 2007-2011
 * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
 * Tom Cubie <tangliang@allwinnertech.com>
 *
 * Configuration settings for the Allwinner A10-evb board.
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#include <asm/arch/cpu.h>

#define SUNXI_WDOG_CTL		0x01C20CB0
#define SUNXI_WDOG_CFG		0x01C20CB4
#define SUNXI_WDOG_MODE		0x01C20CB8

.globl sunxi_reset
sunxi_reset:
	ldr r1, =SUNXI_WDOG_CFG
	mov r3, #0x1
	str r3, [r1]
	ldr r1, =SUNXI_WDOG_MODE
	mov r3, #0x1
	str r3, [r1]
	mov r0, r0
_loop_forever:
	b	_loop_forever
