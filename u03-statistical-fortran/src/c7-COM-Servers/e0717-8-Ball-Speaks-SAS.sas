proc iml;
    /* SAS/IML program that uses the Magic8Obj COM Server */

    /* initializations */
    result = 0;
    msg = "12345678901234567890123456"; /* 26 characters */

    /* load SAS/COM interop function definitions */
    filename sascbtbl ’e:\project\magic8_com\clients\sascomio.cbt’;

    /* create object instance */
    pMagic8 = modulein(’createobj’, ’magic8_com.Magic8Obj’ );

    /* invoke ’msg’ property */
    result = modulein(’getpropchar’, pMagic8, ’msg’, 1, 1, msg, 0);

    /* release object from memory */
    call modulei(’releaseobj’, pMagic8);

    /* print message */
    print msg;
quit;