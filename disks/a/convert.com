1v�! 
!  "
��	CONVERT Version 2.3

 :] � ��	CONVERT converts between BBC BASIC internal format
(.BBC ) and ASCII (.BAS).  Its options are as follows:

CONVERT               Prints this description.
CONVERT filename.BBC  Converts from BBC BASIC internal
                      format to ASCII.
CONVERT filename.BAS  Converts from ASCII to BBC BASIC
                      internal format.
 �
!\ $ ���	e  !���(<!����B��	Invalid extension - must be .BBC or .BAS �BBCBAS!�
���4	�v	�(,�v	o�v	g�(�3���	Sorry - file protected >ͽ	��	��ǯͽ	>�ͽ	>�ͽ	�!�
���4	�!6 ��F ��v	�(��
(��(��	 > �w �#([�� ������!6ͥ��|����[
"
�7�R�6���6��R� }ͽ	�}ͽ	|ͽ	!6~ͽ	~#� ��M��	Line too long - abort �.��	** Line number added **
 *
#���	** Line number out of sequence **
 ɀAND�ABS�ACS�ADVAL�ASC�ASN�ATN�AUTO�BGET �BPUT �COLOUR�COLOR�CALL�CHAIN�CHR$�CLEAR �CLOSE �CLG �CLS �COS�COUNT �DATA�DEG�DEF�DELETE�DIV�DIM�DRAW�ENDPROC �END �ENVELOPE�ELSE�EVAL�ERL �ERROR�EOF �EOR�ERR �EXP�EXT �FOR�FALSE �FN�GOTO�GET$�GET�GOSUB�GCOL�HIMEM �INPUT�IF�INKEY$�INKEY�INT�INSTR(�LIST�LINE�LOAD�LOMEM �LOCAL�LEFT$(�LEN�LET�LOG�LN�MID$(�MODE�MOD�MOVE�NEXT�NEW �NOT�OLD �ON�OFF�OR�OPENIN�OPENOUT�OPENUP�OSCLI�PRINT�PAGE �PTR �PI �PLOT�POINT(�PROC�POS �PUT�RETURN �REPEAT�REPORT �READ�REM�RUN �RAD�RESTORE�RIGHT$(�RND �RENUMBER�STEP�SAVE�SGN�SIN�SQR�SPC�STR$�STRING$(�SOUND�STOP �TAN�THEN�TO�TAB(�TRACE�TIME �TRUE �UNTIL�USR�VDU�VAL�VPOS �WIDTH�HIMEM�LOMEM�PAGE�PTR�TIME�������� �������~ � ��#�!6�~ F#�(�#�~(����#�~ �#�~ �.(�(���8���~� ��+�x��z> ͽ	�v	�ʶ	�" �M��C½	�� ͈ ��	��!6��� 
~#�Ľ	�~(���� '��R<0�=(����Ľ	x�()T]))��7�!  ���~ �0��:��#)T]))�_ ��~ �$��%��(��0��:?��A��[?��_��{?��#�~ ����0˩˙� (��,(��G8˙�" �?��a(ˡ��ͥ��|�Ī�(	 �����*(�����8��0�@��(�� ����(	��(��8���& ��!� ��� ��!�� ��� ������������:�v	�G�v	W˲xG���o�v	W˲x���g����6�#z��G{����Tw#{�?�@w#z�?�@w#��
>�b	<���	Close error ��Z	>�b	������Z	>�b	���	Disk full �\ >�b	�6  ���<���	File not found �
>�b	>�b	�6 <���	Directory full �>��b	���������O� �����������F ���\ !6
 �N ��	~˹�q ������	End of file - abort ���>ͽ	>
��� �N
!�
�	w���˹�q�����~��>ͽ	����	��~#����	��_>�b	��