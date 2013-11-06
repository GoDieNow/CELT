/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xcb73ee62 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/alumnos/ProCelt1/registro.vhd";



static void work_a_0827584957_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 752U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 1632);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 592U);
    t8 = *((char **)t4);
    t4 = (t0 + 1676);
    t9 = (t4 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 14U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB3;

LAB5:    t4 = (t0 + 776U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}


extern void work_a_0827584957_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0827584957_3212880686_p_0};
	xsi_register_didat("work_a_0827584957_3212880686", "isim/test_registro_isim_beh.exe.sim/work/a_0827584957_3212880686.didat");
	xsi_register_executes(pe);
}
