#��ָ�����ƣ�memI/Oֻ������Ϊ��λ
lui s1,0xFFFFF
begin:
    lh s2,0x72(s1)#sw21��sw20������ʾģʽ
    #addi s2,x0,0x10
    andi s2,s2,0x30
    addi s5,x0,0x30
    beq s2,s5,mode3
    addi s3,x0,0x10
    beq s2,s3,mode1
    addi s4,x0,0x20
    beq s2,s4,mode2
    jal x0,begin

mode1:
    add s2,x0,x0#��8λ�ƣ���ַ0xFFFFF062
    add s3,x0,x0#��16λ�ƣ���ַ0xFFFFF060
    addi s4,x0,0x18
    lui s5,0x800
    addi s6,x0,0x1
    mode11:#�������м��������8λδ��ȫ����
        xor s3,s3,s5
        xor s3,s3,s6
        add s2,s3,x0
        srli s2,s2,0x10
        
      
        addi t5,x0,25
        stop1:
        	addi t5,t5,-1
        	bne t5,x0,stop1
        	
        sw s3,0x60(s1)
        sh s2,0x62(s1)
        srli s5,s5,0x1
        slli s6,s6,0x1
        addi s4,s4,-1
        bne s4,x0,mode11
    jal x0,begin

mode2:
    addi s2,x0,0x0#��8λ�ƣ���ַ0xFFFFF062
    addi s3,x0,0x0#��16λ�ƣ���ַ0xFFFFF060
    lui s5,0x800
    addi s4,x0,0x1
    mode21:#��������������8λδ��ȫ����
        xor s3,s3,s5
        add s2,s3,x0
        srli s2,s2,0x10
        
        addi t5,x0,25
        stop2:
        	addi t5,t5,-1
        	bne t5,x0,stop2
        
        sw s3,0x60(s1)
        sh s2,0x62(s1)
        srli s5,s5,0x1
        bne s5,x0,mode21
        beq s4,x0,begin
        lui s5,0x800
        addi s4,s4,-1
        jal x0,mode21

mode3:
    #sw4-sw0�����ж��ٵ���
    lb s5,0x70(s1)#��ȡ��������
    #addi s5,x0,0x1
    add s3,x0,x0
    lui s4,0x800#��s4=0x00800000
    mode31:#����
        srli s3,s3,0x1
        or s3,s3,s4
        addi s5,s5,-1#�������������Σ��������λ�ĵ�����
        bne s5,x0,mode31
    add s2,s3,x0#����
    srli s2,s2,0x10#��[23:16]����[7:0]
    sw s3,0x60(s1)
    sh s2,0x62(s1)#д��LED
    addi s6,x0,0x18#һ��Ҫ����24��
    mode32:#����
        andi s4,s3,0x1#ȡ�����λ
        slli s4,s4,0x17#�������λ
        srli s3,s3,0x1#����һλ
        or s3,s3,s4#�������λ
        or s2,s3,x0#����
        srli s2,s2,0x10#��[23:16]����[7:0]
        
        addi t5,x0,25
        stop3:
        	addi t5,t5,-1
        	bne t5,x0,stop3
        
        sw s3,0x60(s1)
        sh s2,0x62(s1)#д��LED
        addi s6,s6,-1
        bne s6,x0,mode32
    jal x0,begin