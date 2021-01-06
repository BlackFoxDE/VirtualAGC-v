import sys

def decode_instruction(opcode, ext):
    sq = opcode >> 12
    qc = (opcode >> 10) & 0o3
    s = opcode & 0o7777
    es = s & 0o1777
    if ext:
        sq += 0o10
    if sq == 0o0:
        if s == 0o3:
            return 'RELINT'
        elif s == 0o4:
            return 'INHINT'
        elif s == 0o6:
            return 'EXTEND'
        else:
            return 'TC %04o' % s
    elif sq == 0o1:
        if qc == 0o0:
            return 'CCS %04o' % es
        else:
            return 'TCF %04o' % s
    elif sq == 0o2:
        if qc == 0o0:
            return 'DAS %04o' % (es-1)
        elif qc == 0o1:
            return 'LXCH %04o' % es
        elif qc == 0o2:
            return 'INCR %04o' % es
        elif qc == 0o3:
            return 'ADS %04o' % es
    elif sq == 0o3:
        return 'CA %04o' % s
    elif sq == 0o4:
        return 'CS %04o' % s
    elif sq == 0o5:
        if qc == 0o0:
            if s == 0o17:
                return 'RESUME'
            else:
                return 'INDEX %04o' % es
        elif qc == 0o1:
            return 'DXCH %04o' % (es-1)
        elif qc == 0o2:
            return 'TS %04o' % es
        elif qc == 0o3:
            return 'XCH %04o' % es
    elif sq == 0o6:
        return 'AD %04o' % s
    elif sq == 0o7:
        return 'MASK %04o' % s
    elif sq == 0o10:
        s10 = (opcode >> 9) & 0o1
        if qc == 0o0:
            if s10 == 0o0:
                return 'READ %04o' % (es & 0o777)
            else:
                return 'WRITE %04o' % (es & 0o777)
        elif qc == 0o1:
            if s10 == 0o0:
                return 'RAND %04o' % (es & 0o777)
            else:
                return 'WAND %04o' % (es & 0o777)
        elif qc == 0o2:
            if s10 == 0o0:
                return 'ROR %04o' % (es & 0o777)
            else:
                return 'WOR %04o' % (es & 0o777)
        elif qc == 0o3:
            if s10 == 0o0:
                return 'RXOR %04o' % (es & 0o777)
            else:
                return 'RUPT'
    elif sq == 0o11:
        if qc == 0o0:
            return 'DV %04o' % es
        else:
            return 'BZF %04o' % s
    elif sq == 0o12:
        if qc == 0o0:
            return 'MSU %04o' % es
        elif qc == 0o1:
            return 'QXCH %04o' % es
        elif qc == 0o2:
            return 'AUG %04o' % es
        elif qc == 0o3:
            return 'DIM %04o' % es
    elif sq == 0o13:
        return 'DCA %04o' % (s-1)
    elif sq == 0o14:
        return 'DCS %04o' % (s-1)
    elif sq == 0o15:
        return 'INDEX %04o' % s
    elif sq == 0o16:
        if qc == 0o0:
            return 'SU %04o' % es
        else:
            return 'BZMF %04o' % s
    elif sq == 0o16:
        return 'MP %04o' % s

    return '???'

while True:
    try:
        sim_input = input().split(" ")
    except:
        exit(0)

    opcode = 0
    futext = False
    found_num = False

    for index, data in enumerate(sim_input):
        if(data == "G:"):
            try:
                opcode = int(sim_input[index + 1].replace(",", ""), base=8)
                found_num = True
            except:
                pass
        if(data == "FUTEXT:"):
            if(sim_input[index + 1] == "1,"):
                futext = True
            else:
                futext = False
    if found_num:
        print(" ".join(sim_input) + ", INSTRUCTION:", decode_instruction(opcode, futext))