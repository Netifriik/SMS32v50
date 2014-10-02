nupud:
    CLO                 ; Sule teised protsessid
    ; ‹lesse k‰ik
    MOV AL,77
    MOV [E0],AL         ; RAM [E0] - t‰heks on W 

    ; Alla k‰ik
    MOV AL,73
    MOV [E1],AL         ; RAM [E1] - t‰heks on S 

    ; Vasakule k‰ik
    MOV AL,61
    MOV [E2],AL         ; RAM [E2] - t‰heks on A 

    ; Paremale k‰ik
    MOV AL,64
    MOV [E3],AL         ; RAM [E3] - t‰heks on D 

    MOV AL,FF
    OUT 04
    JMP snake

yles:
    ADD CL,40
    
alla:
    ADD CL,20
    
vasakule:
    ADD CL,10
    
paremale:
    ADD CL,10
    ADD CL,8        ; lisame v‰‰rtusele 8
    PUSH CL
    POP AL
    OUT 04          ; liigutab ussi
    JMP snake       ; hypa algusesse, et uuesti liigutada

snake:
    MOV CL,0
    IN 00           ; tuvasta klaviatuuri vajutust
    CMP AL,[E0]     ; kui nupu vajutus on W, liigu ylesse
    JZ yles         ; mine ylesse, v6i j2tka
    CMP AL,[E1]     ; ja nii teiste nupudega..
    JZ alla
    CMP AL,[E2]
    JZ vasakule
    CMP AL,[E3]
    JZ paremale
    END