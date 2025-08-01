% Matlab M file that uses the Magic8Obj COM Server

% create object instance
objMagic8 = actxserver( ’magic8_com.Magic8Obj’);

% invoke ’msg’ property
msg = get(objMagic8,’msg’);

% release object from memory
release(objMagic8);

% print message
fprintf(’\n\n %s\n’,msg);