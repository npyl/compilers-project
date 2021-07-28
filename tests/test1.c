// comment
PROGRAM test1;
FUNCTION myfunc1(INT i, CHAR c)
    FUNCTION myfunc2(INT i2)
        RETURN 10;
    END_FUNCTION
    RETURN 0;
END_FUNCTION
STARTMAIN
    STRUCT
    VARS
        INT i, i2[10], i3[2];
        CHAR c[2];
        INT i4;
    ENDSTRUCT
ENDMAIN