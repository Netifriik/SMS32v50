nupud:
    CLO                 ; Sule teised protsessid
    ; Ülesse käik
    MOV AL,77
    MOV [E0],AL         ; RAM [E0] - täheks on w 

    ; Alla käik
    MOV AL,73
    MOV [E1],AL         ; RAM [E1] - täheks on s 

    ; Vasakule käik
    MOV AL,61
    MOV [E2],AL         ; RAM [E2] - täheks on a 

    ; Paremale käik
    MOV AL,64
    MOV [E3],AL         ; RAM [E3] - täheks on d 

    MOV AL,FF
    OUT 04
    JMP snake

yles:		    ; 88
    ADD CL,40       ; -- 40 + 20 + 10 + 10 + 8
    
alla:		    ; 48
    ADD CL,20       ; -- 20 + 10 + 10 + 8
    
vasakule:	    ; 28
    ADD CL,10	    ; -- 10 + 10 + 8
    
paremale:	    ; 18
    ADD CL,10	    ; -- 10 + 8
    ADD CL,8        ; Lisan saadud väärtusele 8

    ; MOV CL,AL ei tööta, ütleb mulle kasutada PUSH POP
    ; Nii palju kui ma aru sain siis OUT 04 tahab võtta AL registrist, mul ju CL..
    ; Kui saab ka kuidagi ilma pushpopita siis ma pole piisavalt manuali lappanud

    PUSH CL	    ; Lükkame saadud väärtuse läbi push-popi
    POP AL          ; ======================================
    OUT 04          ; Peale push-popi saan nüüd väljastada väärtuse
    JMP snake       ; Hüpa klahvi tuvastuseni

snake:
    MOV CL,0	    ; Nullime väärtuse, et saaks uuesti välja arvutada liigutuse

    IN 00           ; Tuvastame klahvi (00 - input)
    CMP AL,[E0]     ; if w
    JZ yles         ; mine yles
    CMP AL,[E1]     ; else if s
    JZ alla	    ; mine alla
    CMP AL,[E2]     ; else if a
    JZ vasakule     ; mine vasakule
    CMP AL,[E3]     ; else if d
    JZ paremale     ; mine paremale
    JMP snake       ; Kui jooksis siiani ja me ei saanudki sobivat klahvi siis viska uuesti prompt. Ära jooksuta mängu kokku
    
    END
