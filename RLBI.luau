local Select	= select;
local Byte		= string.byte;
local Sub		= string.sub;
local Opmode = {
	{b = 'OpArgR', c='OpArgN'}, {b = 'OpArgK', c='OpArgN'}, {b = 'OpArgU', c='OpArgU'},
	{b = 'OpArgR', c='OpArgN'}, {b = 'OpArgU', c='OpArgN'}, {b = 'OpArgK', c='OpArgN'},
	{b = 'OpArgR', c='OpArgK'}, {b = 'OpArgK', c='OpArgN'}, {b = 'OpArgU', c='OpArgN'},
	{b = 'OpArgK', c='OpArgK'}, {b = 'OpArgU', c='OpArgU'}, {b = 'OpArgR', c='OpArgK'},
	{b = 'OpArgK', c='OpArgK'}, {b = 'OpArgK', c='OpArgK'}, {b = 'OpArgK', c='OpArgK'},
	{b = 'OpArgK', c='OpArgK'}, {b = 'OpArgK', c='OpArgK'}, {b = 'OpArgK', c='OpArgK'},
	{b = 'OpArgR', c='OpArgN'}, {b = 'OpArgR', c='OpArgN'}, {b = 'OpArgR', c='OpArgN'},
	{b = 'OpArgR', c='OpArgR'}, {b = 'OpArgR', c='OpArgN'}, {b = 'OpArgK', c='OpArgK'},
	{b = 'OpArgK', c='OpArgK'}, {b = 'OpArgK', c='OpArgK'}, {b = 'OpArgR', c='OpArgU'},
	{b = 'OpArgR', c='OpArgU'}, {b = 'OpArgU', c='OpArgU'}, {b = 'OpArgU', c='OpArgU'},
	{b = 'OpArgU', c='OpArgN'}, {b = 'OpArgR', c='OpArgN'}, {b = 'OpArgR', c='OpArgN'},
	{b = 'OpArgN', c='OpArgU'}, {b = 'OpArgU', c='OpArgU'}, {b = 'OpArgN', c='OpArgN'},
	{b = 'OpArgU', c='OpArgN'}, {b = 'OpArgU', c='OpArgN'}
};
local Opcode	= {
	'ABC',	'ABx',	'ABC',	'ABC';
	'ABC',	'ABx',	'ABC',	'ABx';
	'ABC',	'ABC',	'ABC',	'ABC';
	'ABC',	'ABC',	'ABC',	'ABC';
	'ABC',	'ABC',	'ABC',	'ABC';
	'ABC',	'ABC',	'AsBx',	'ABC';
	'ABC',	'ABC',	'ABC',	'ABC';
	'ABC',	'ABC',	'ABC',	'AsBx';
	'AsBx',	'ABC',	'ABC',	'ABC';
	'ABx',	'ABC';
};
local function gBit(Bit, Start, End)
    if End then
        local Res = (Bit / 2 ^ (Start - 1)) % 2 ^ ((End - 1) - (Start - 1) + 1)

        return Res - Res % 1
    else
        local Plc = 2 ^ (Start - 1)

        if (Bit % (Plc + Plc) >= Plc) then
            return 1
        else
            return 0
        end
    end
end
local function GetMeaning(ByteString)
    local Pos, gSizet, gInt = 1, nil, nil

    local function gBits8()
        local F = Byte(ByteString, Pos, Pos)

        Pos = Pos + 1

        return F
    end
    local function gBits32()
        local W, X, Y, Z = Byte(ByteString, Pos, Pos + 3)

        Pos = Pos + 4

        return (Z * 16777216) + (Y * 65536) + (X * 256) + W
    end
    local function gFloat()
        local Left, Right, IsNormal = gBits32(), gBits32(), 1
        local Mantissa, Exponent, Sign = (gBit(Right, 1, 20) * (4294967296)) + Left, gBit(Right, 21, 31), ((
-1) ^ gBit(Right, 32))

        if (Exponent == 0) then
            if (Mantissa == 0) then
                return Sign * 0
            else
                Exponent = 1
                IsNormal = 0
            end
        elseif (Exponent == 2047) then
            if (Mantissa == 0) then
                return Sign * math.huge
            else
                return Sign * (0 / 0)
            end
        end

        return math.ldexp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (4503599627370496)))
    end
    local function gString(Len)
        local Str

        if Len then
            Str = Sub(ByteString, Pos, Pos + Len - 1)
            Pos = Pos + Len
        else
            Len = gSizet()

            if (Len == 0) then
                return
            end

            Str = Sub(ByteString, Pos, Pos + Len - 1)
            Pos = Pos + Len
        end

        return Str
    end
    local function ChunkDecode()
        local Instr, Const, Proto = {}, {}, {}
        local Chunk, ConstantReferences = {
            Instr = Instr,
            Const = Const,
            Proto = Proto,
            Lines = {},
            Name = gString(),
            FirstL = gInt(),
            LastL = gInt(),
            Upvals = gBits8(),
            Args = gBits8(),
            Vargs = gBits8(),
            Stack = gBits8(),
        }, {}

        if Chunk.Name then
            Chunk.Name = Sub(Chunk.Name, 1, -2)
        end

        for Idx = 1, gInt() do
            local Data = gBits32()
            local Opco = gBit(Data, 1, 6)
            local Type, Mode, Inst = Opcode[Opco + 1], Opmode[Opco + 1], {
                Enum = Opco,
                Value = Data,
                gBit(Data, 7, 14),
            }

            if (Type == 'ABC') then
                Inst[2] = gBit(Data, 24, 32)
                Inst[3] = gBit(Data, 15, 23)
            elseif (Type == 'ABx') then
                Inst[2] = gBit(Data, 15, 32)
            elseif (Type == 'AsBx') then
                Inst[2] = gBit(Data, 15, 32) - 131071
            end

            do
                if Opco == 26 or Opco == 27 then
                    Inst[3] = Inst[3] == 0
                end
                if Opco >= 23 and Opco <= 25 then
                    Inst[1] = Inst[1] ~= 0
                end
                if Mode.b == 'OpArgK' then
                    Inst[3] = Inst[3] or false

                    if Inst[2] >= 256 then
                        local Cons = Inst[2] - 256

                        Inst[4] = Cons

                        local ReferenceData = ConstantReferences[Cons]

                        if not ReferenceData then
                            ReferenceData = {}
                            ConstantReferences[Cons] = ReferenceData
                        end

                        ReferenceData[#ReferenceData + 1] = {
                            Inst = Inst,
                            Register = 4,
                        }
                    end
                end
                if Mode.c == 'OpArgK' then
                    Inst[4] = Inst[4] or false

                    if Inst[3] >= 256 then
                        local Cons = Inst[3] - 256

                        Inst[5] = Cons

                        local ReferenceData = ConstantReferences[Cons]

                        if not ReferenceData then
                            ReferenceData = {}
                            ConstantReferences[Cons] = ReferenceData
                        end

                        ReferenceData[#ReferenceData + 1] = {
                            Inst = Inst,
                            Register = 5,
                        }
                    end
                end
            end

            Instr[Idx] = Inst
        end
        for Idx = 1, gInt() do
            local Type, Cons = gBits8(), nil

            if (Type == 1) then
                Cons = (gBits8() ~= 0)
            elseif (Type == 3) then
                Cons = gFloat()
            elseif (Type == 4) then
                Cons = Sub(gString(), 1, -2)
            end

            local Refs = ConstantReferences[Idx - 1]

            if Refs then
                for i = 1, #Refs do
                    Refs[i].Inst[Refs[i].Register] = Cons
                end
            end

            Const[Idx - 1] = Cons
        end
        for Idx = 1, gInt() do
            Proto[Idx - 1] = ChunkDecode()
        end

        do
            local Lines = Chunk.Lines

            for Idx = 1, gInt() do
                Lines[Idx] = gBits32()
            end
            for _ = 1, gInt() do
                gString()
                gBits32()
                gBits32()
            end
            for _ = 1, gInt() do
                gString()
            end
        end

        return Chunk
    end

    return ChunkDecode()
end

return GetMeaning
