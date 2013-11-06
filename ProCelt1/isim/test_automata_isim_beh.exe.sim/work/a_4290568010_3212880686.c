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
static const char *ng0 = "C:/Documents and Settings/alumno/ProCelt1/automata.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_4290568010_3212880686_p_0(char *t0)
{
    char t6[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    char *t27;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14};

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 776U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t7 = ((IEEE_P_2592010699) + 2332);
    t1 = xsi_base_array_concat(t1, t6, t7, (char)99, t3, (char)99, t5, (char)101);
    t8 = (t0 + 1408U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t10 = (1U + 1U);
    memcpy(t8, t1, t10);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2204);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2240);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 2276);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 568U);
    t5 = xsi_signal_has_event(t1);
    if (t5 == 1)
        goto LAB5;

LAB6:    t3 = (unsigned char)0;

LAB7:    if (t3 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2160);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1144U);
    t7 = *((char **)t2);
    t13 = *((unsigned char *)t7);
    t2 = (char *)((nl0) + t13);
    goto **((char **)t2);

LAB5:    t2 = (t0 + 592U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB7;

LAB8:    goto LAB3;

LAB9:    xsi_set_current_line(59, ng0);
    t8 = (t0 + 684U);
    t9 = *((char **)t8);
    t15 = *((unsigned char *)t9);
    t16 = (t15 == (unsigned char)2);
    if (t16 == 1)
        goto LAB18;

LAB19:    t14 = (unsigned char)0;

LAB20:    if (t14 != 0)
        goto LAB15;

LAB17:
LAB16:    goto LAB8;

LAB10:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 4108U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t6, t2, t1, 1);
    t7 = (t0 + 2348);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t17 = (t9 + 40U);
    t20 = *((char **)t17);
    memcpy(t20, t4, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 4108U);
    t3 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t2, t1, 20);
    if (t3 != 0)
        goto LAB21;

LAB23:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB22:    goto LAB8;

LAB11:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 4108U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t6, t2, t1, 1);
    t7 = (t0 + 2348);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t17 = (t9 + 40U);
    t20 = *((char **)t17);
    memcpy(t20, t4, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 4108U);
    t3 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t2, t1, 38);
    if (t3 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB25:    goto LAB8;

LAB12:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2240);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB13:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2204);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2240);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB14:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2276);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB8;

LAB15:    xsi_set_current_line(60, ng0);
    t8 = (t0 + 2312);
    t20 = (t8 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)1;
    xsi_driver_first_trans_fast(t8);
    goto LAB16;

LAB18:    t8 = (t0 + 776U);
    t17 = *((char **)t8);
    t18 = *((unsigned char *)t17);
    t19 = (t18 == (unsigned char)2);
    t14 = t19;
    goto LAB20;

LAB21:    xsi_set_current_line(67, ng0);
    t4 = xsi_get_transient_memory(8U);
    memset(t4, 0, 8U);
    t7 = t4;
    memset(t7, (unsigned char)2, 8U);
    t8 = (t0 + 2348);
    t9 = (t8 + 32U);
    t17 = *((char **)t9);
    t20 = (t17 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t4, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB22;

LAB24:    xsi_set_current_line(77, ng0);
    t4 = xsi_get_transient_memory(8U);
    memset(t4, 0, 8U);
    t7 = t4;
    memset(t7, (unsigned char)2, 8U);
    t8 = (t0 + 2348);
    t9 = (t8 + 32U);
    t17 = *((char **)t9);
    t20 = (t17 + 40U);
    t21 = *((char **)t20);
    memcpy(t21, t4, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1408U);
    t2 = *((char **)t1);
    t1 = (t0 + 4162);
    t24 = xsi_mem_cmp(t1, t2, 2U);
    if (t24 == 1)
        goto LAB28;

LAB32:    t7 = (t0 + 4164);
    t25 = xsi_mem_cmp(t7, t2, 2U);
    if (t25 == 1)
        goto LAB29;

LAB33:    t9 = (t0 + 4166);
    t26 = xsi_mem_cmp(t9, t2, 2U);
    if (t26 == 1)
        goto LAB30;

LAB34:
LAB31:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(79, ng0);
    t20 = (t0 + 2312);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 40U);
    t27 = *((char **)t23);
    *((unsigned char *)t27) = (unsigned char)5;
    xsi_driver_first_trans_fast(t20);
    goto LAB27;

LAB29:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

LAB30:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t4 = *((char **)t2);
    t7 = (t4 + 40U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB27;

LAB35:;
}


extern void work_a_4290568010_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4290568010_3212880686_p_0};
	xsi_register_didat("work_a_4290568010_3212880686", "isim/test_automata_isim_beh.exe.sim/work/a_4290568010_3212880686.didat");
	xsi_register_executes(pe);
}
