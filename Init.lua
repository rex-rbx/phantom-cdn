local HttpService, UserInputService, InsertService = game:FindService('HttpService'), game:FindService('UserInputService'), game:FindService('InsertService')
local RunService, CoreGui, StarterGui = game:GetService('RunService'), game:FindService('CoreGui'), game:GetService('StarterGui')
local VirtualInputManager, RobloxReplicatedStorage = Instance.new('VirtualInputManager'), game:GetService('RobloxReplicatedStorage')

if RobloxReplicatedStorage:FindFirstChild('Init') then
    return
end

local InitContainer = Instance.new('Folder', RobloxReplicatedStorage)

InitContainer.Name = 'Init'

local objectPointerContainer, scriptsContainer = Instance.new('Folder', InitContainer), Instance.new('Folder', InitContainer)

objectPointerContainer.Name = 'Instance Pointers'
scriptsContainer.Name = 'Scripts'

local Init = {}
local coreModules, blacklistedModuleParents = {}, {
    'Common',
    'Settings',
    'PlayerList',
    'InGameMenu',
    'PublishAssetPrompt',
    'TopBar',
    'InspectAndBuy',
    'VoiceChat',
    'Chrome',
    'PurchasePrompt',
    'VR',
    'EmotesMenu',
}

local libs = {
    {
        name = 'HashLib',
        func = function()
            local Alphabet = {}
            local Indexes = {}

            for Index = 65, 90 do
                table.insert(Alphabet, Index)
            end
            for Index = 97, 122 do
                table.insert(Alphabet, Index)
            end
            for Index = 48, 57 do
                table.insert(Alphabet, Index)
            end

            table.insert(Alphabet, 43)
            table.insert(Alphabet, 47)

            for Index, Character in ipairs(Alphabet)do
                Indexes[Character] = Index
            end

            local Base64 = {}
            local bit32_rshift = bit32.rshift
            local bit32_lshift = bit32.lshift
            local bit32_band = bit32.band

            function Base64.Encode(Input)
                local Output = {}
                local Length = 0

                for Index = 1, #Input, 3 do
                    local C1, C2, C3 = string.byte(Input, Index, Index + 2)
                    local A = bit32_rshift(C1, 2)
                    local B = bit32_lshift(bit32_band(C1, 3), 4) + bit32_rshift(C2 or 0, 4)
                    local C = bit32_lshift(bit32_band(C2 or 0, 15), 2) + bit32_rshift(C3 or 0, 6)
                    local D = bit32_band(C3 or 0, 63)

                    Length = Length + 1
                    Output[Length] = Alphabet[A + 1]
                    Length = Length + 1
                    Output[Length] = Alphabet[B + 1]
                    Length = Length + 1
                    Output[Length] = C2 and Alphabet[C + 1] or 61
                    Length = Length + 1
                    Output[Length] = C3 and Alphabet[D + 1] or 61
                end

                local NewOutput = {}
                local NewLength = 0
                local IndexAdd4096Sub1

                for Index = 1, Length, 4096 do
                    NewLength = NewLength + 1
                    IndexAdd4096Sub1 = Index + 4096 - 1
                    NewOutput[NewLength] = string.char(table.unpack(Output, Index, IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1))
                end

                return table.concat(NewOutput)
            end
            function Base64.Decode(Input)
                local Output = {}
                local Length = 0

                for Index = 1, #Input, 4 do
                    local C1, C2, C3, C4 = string.byte(Input, Index, Index + 3)
                    local I1 = Indexes[C1] - 1
                    local I2 = Indexes[C2] - 1
                    local I3 = (Indexes[C3] or 1) - 1
                    local I4 = (Indexes[C4] or 1) - 1
                    local A = bit32_lshift(I1, 2) + bit32_rshift(I2, 4)
                    local B = bit32_lshift(bit32_band(I2, 15), 4) + bit32_rshift(I3, 2)
                    local C = bit32_lshift(bit32_band(I3, 3), 6) + I4

                    Length = Length + 1
                    Output[Length] = A

                    if C3 ~= 61 then
                        Length = Length + 1
                        Output[Length] = B
                    end
                    if C4 ~= 61 then
                        Length = Length + 1
                        Output[Length] = C
                    end
                end

                local NewOutput = {}
                local NewLength = 0
                local IndexAdd4096Sub1

                for Index = 1, Length, 4096 do
                    NewLength = NewLength + 1
                    IndexAdd4096Sub1 = Index + 4096 - 1
                    NewOutput[NewLength] = string.char(table.unpack(Output, Index, IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1))
                end

                return table.concat(NewOutput)
            end

            local ipairs = ipairs
            local bit32_band = bit32.band
            local bit32_bor = bit32.bor
            local bit32_bxor = bit32.bxor
            local bit32_lshift = bit32.lshift
            local bit32_rshift = bit32.rshift
            local bit32_lrotate = bit32.lrotate
            local bit32_rrotate = bit32.rrotate
            local sha2_K_lo, sha2_K_hi, sha2_H_lo, sha2_H_hi, sha3_RC_lo, sha3_RC_hi = {}, {}, {}, {}, {}, {}
            local sha2_H_ext256 = {
                [224] = {},
                [256] = sha2_H_hi,
            }
            local sha2_H_ext512_lo, sha2_H_ext512_hi = {
                [384] = {},
                [512] = sha2_H_lo,
            }, {
                [384] = {},
                [512] = sha2_H_hi,
            }
            local md5_K, md5_sha1_H = {}, {
                0x67452301,
                0xefcdab89,
                0x98badcfe,
                0x10325476,
                0xc3d2e1f0,
            }
            local md5_next_shift = {
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                28,
                25,
                26,
                27,
                0,
                0,
                10,
                9,
                11,
                12,
                0,
                15,
                16,
                17,
                18,
                0,
                20,
                22,
                23,
                21,
            }
            local HEX64, XOR64A5, lanes_index_base
            local common_W = {}
            local K_lo_modulo, hi_factor, hi_factor_keccak = 4294967296, 0, 0
            local TWO_POW_NEG_56 = 1.3877787807814457e-17
            local TWO_POW_NEG_17 = 0.00000762939453125
            local TWO_POW_2 = 4
            local TWO_POW_3 = 8
            local TWO_POW_4 = 16
            local TWO_POW_5 = 32
            local TWO_POW_6 = 64
            local TWO_POW_7 = 128
            local TWO_POW_8 = 256
            local TWO_POW_9 = 512
            local TWO_POW_10 = 1024
            local TWO_POW_11 = 2048
            local TWO_POW_12 = 4096
            local TWO_POW_13 = 8192
            local TWO_POW_14 = 16384
            local TWO_POW_15 = 32768
            local TWO_POW_16 = 65536
            local TWO_POW_17 = 131072
            local TWO_POW_18 = 262144
            local TWO_POW_19 = 524288
            local TWO_POW_20 = 1048576
            local TWO_POW_21 = 2097152
            local TWO_POW_22 = 4194304
            local TWO_POW_23 = 8388608
            local TWO_POW_24 = 16777216
            local TWO_POW_25 = 33554432
            local TWO_POW_26 = 67108864
            local TWO_POW_27 = 134217728
            local TWO_POW_28 = 268435456
            local TWO_POW_29 = 536870912
            local TWO_POW_30 = 1073741824
            local TWO_POW_31 = 2147483648
            local TWO_POW_32 = 4294967296
            local TWO_POW_40 = 1099511627776
            local TWO56_POW_7 = 72057594037927940

            local function sha256_feed_64(H, str, offs, size)
                local W, K = common_W, sha2_K_hi
                local h1, h2, h3, h4, h5, h6, h7, h8 = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]

                for pos = offs, offs + size - 1, 64 do
                    for j = 1, 16 do
                        pos = pos + 4

                        local a, b, c, d = string.byte(str, pos - 3, pos)

                        W[j] = ((a * 256 + b) * 256 + c) * 256 + d
                    end
                    for j = 17, 64 do
                        local a, b = W[j - 15], W[j - 2]

                        W[j] = bit32_bxor(bit32_rrotate(a, 7), bit32_lrotate(a, 14), bit32_rshift(a, 3)) + bit32_bxor(bit32_lrotate(b, 15), bit32_lrotate(b, 13), bit32_rshift(b, 10)) + W[j - 7] + W[j - 16]
                    end

                    local a, b, c, d, e, f, g, h = h1, h2, h3, h4, h5, h6, h7, h8

                    for j = 1, 64 do
                        local z = bit32_bxor(bit32_rrotate(e, 6), bit32_rrotate(e, 11), bit32_lrotate(e, 7)) + bit32_band(e, f) + bit32_band(
-1 - e, g) + h + K[j] + W[j]

                        h = g
                        g = f
                        f = e
                        e = z + d
                        d = c
                        c = b
                        b = a
                        a = z + bit32_band(d, c) + bit32_band(a, bit32_bxor(d, c)) + bit32_bxor(bit32_rrotate(a, 2), bit32_rrotate(a, 13), bit32_lrotate(a, 10))
                    end

                    h1, h2, h3, h4 = (a + h1) % 4294967296, (b + h2) % 4294967296, (c + h3) % 4294967296, (d + h4) % 4294967296
                    h5, h6, h7, h8 = (e + h5) % 4294967296, (f + h6) % 4294967296, (g + h7) % 4294967296, (h + h8) % 4294967296
                end

                H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] = h1, h2, h3, h4, h5, h6, h7, h8
            end
            local function sha512_feed_128(H_lo, H_hi, str, offs, size)
                local W, K_lo, K_hi = common_W, sha2_K_lo, sha2_K_hi
                local h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo = H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8]
                local h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi = H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8]

                for pos = offs, offs + size - 1, 128 do
                    for j = 1, 32 do
                        pos = pos + 4

                        local a, b, c, d = string.byte(str, pos - 3, pos)

                        W[j] = ((a * 256 + b) * 256 + c) * 256 + d
                    end
                    for jj = 34, 160, 2 do
                        local a_lo, a_hi, b_lo, b_hi = W[jj - 30], W[jj - 31], W[jj - 4], W[jj - 5]
                        local tmp1 = bit32_bxor(bit32_rshift(a_lo, 1) + bit32_lshift(a_hi, 31), bit32_rshift(a_lo, 8) + bit32_lshift(a_hi, 24), bit32_rshift(a_lo, 7) + bit32_lshift(a_hi, 25)) % 4294967296 + bit32_bxor(bit32_rshift(b_lo, 19) + bit32_lshift(b_hi, 13), bit32_lshift(b_lo, 3) + bit32_rshift(b_hi, 29), bit32_rshift(b_lo, 6) + bit32_lshift(b_hi, 26)) % 4294967296 + W[jj - 14] + W[jj - 32]
                        local tmp2 = tmp1 % 4294967296

                        W[jj - 1] = bit32_bxor(bit32_rshift(a_hi, 1) + bit32_lshift(a_lo, 31), bit32_rshift(a_hi, 8) + bit32_lshift(a_lo, 24), bit32_rshift(a_hi, 7)) + bit32_bxor(bit32_rshift(b_hi, 19) + bit32_lshift(b_lo, 13), bit32_lshift(b_hi, 3) + bit32_rshift(b_lo, 29), bit32_rshift(b_hi, 6)) + W[jj - 15] + W[jj - 33] + (tmp1 - tmp2) / 4294967296
                        W[jj] = tmp2
                    end

                    local a_lo, b_lo, c_lo, d_lo, e_lo, f_lo, g_lo, h_lo = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo
                    local a_hi, b_hi, c_hi, d_hi, e_hi, f_hi, g_hi, h_hi = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi

                    for j = 1, 80 do
                        local jj = 2 * j
                        local tmp1 = bit32_bxor(bit32_rshift(e_lo, 14) + bit32_lshift(e_hi, 18), bit32_rshift(e_lo, 18) + bit32_lshift(e_hi, 14), bit32_lshift(e_lo, 23) + bit32_rshift(e_hi, 9)) % 4294967296 + (bit32_band(e_lo, f_lo) + bit32_band(
-1 - e_lo, g_lo)) % 4294967296 + h_lo + K_lo[j] + W[jj]
                        local z_lo = tmp1 % 4294967296
                        local z_hi = bit32_bxor(bit32_rshift(e_hi, 14) + bit32_lshift(e_lo, 18), bit32_rshift(e_hi, 18) + bit32_lshift(e_lo, 14), bit32_lshift(e_hi, 23) + bit32_rshift(e_lo, 9)) + bit32_band(e_hi, f_hi) + bit32_band(
-1 - e_hi, g_hi) + h_hi + K_hi[j] + W[jj - 1] + (tmp1 - z_lo) / 4294967296

                        h_lo = g_lo
                        h_hi = g_hi
                        g_lo = f_lo
                        g_hi = f_hi
                        f_lo = e_lo
                        f_hi = e_hi
                        tmp1 = z_lo + d_lo
                        e_lo = tmp1 % 4294967296
                        e_hi = z_hi + d_hi + (tmp1 - e_lo) / 4294967296
                        d_lo = c_lo
                        d_hi = c_hi
                        c_lo = b_lo
                        c_hi = b_hi
                        b_lo = a_lo
                        b_hi = a_hi
                        tmp1 = z_lo + (bit32_band(d_lo, c_lo) + bit32_band(b_lo, bit32_bxor(d_lo, c_lo))) % 4294967296 + bit32_bxor(bit32_rshift(b_lo, 28) + bit32_lshift(b_hi, 4), bit32_lshift(b_lo, 30) + bit32_rshift(b_hi, 2), bit32_lshift(b_lo, 25) + bit32_rshift(b_hi, 7)) % 4294967296
                        a_lo = tmp1 % 4294967296
                        a_hi = z_hi + (bit32_band(d_hi, c_hi) + bit32_band(b_hi, bit32_bxor(d_hi, c_hi))) + bit32_bxor(bit32_rshift(b_hi, 28) + bit32_lshift(b_lo, 4), bit32_lshift(b_hi, 30) + bit32_rshift(b_lo, 2), bit32_lshift(b_hi, 25) + bit32_rshift(b_lo, 7)) + (tmp1 - a_lo) / 4294967296
                    end

                    a_lo = h1_lo + a_lo
                    h1_lo = a_lo % 4294967296
                    h1_hi = (h1_hi + a_hi + (a_lo - h1_lo) / 4294967296) % 4294967296
                    a_lo = h2_lo + b_lo
                    h2_lo = a_lo % 4294967296
                    h2_hi = (h2_hi + b_hi + (a_lo - h2_lo) / 4294967296) % 4294967296
                    a_lo = h3_lo + c_lo
                    h3_lo = a_lo % 4294967296
                    h3_hi = (h3_hi + c_hi + (a_lo - h3_lo) / 4294967296) % 4294967296
                    a_lo = h4_lo + d_lo
                    h4_lo = a_lo % 4294967296
                    h4_hi = (h4_hi + d_hi + (a_lo - h4_lo) / 4294967296) % 4294967296
                    a_lo = h5_lo + e_lo
                    h5_lo = a_lo % 4294967296
                    h5_hi = (h5_hi + e_hi + (a_lo - h5_lo) / 4294967296) % 4294967296
                    a_lo = h6_lo + f_lo
                    h6_lo = a_lo % 4294967296
                    h6_hi = (h6_hi + f_hi + (a_lo - h6_lo) / 4294967296) % 4294967296
                    a_lo = h7_lo + g_lo
                    h7_lo = a_lo % 4294967296
                    h7_hi = (h7_hi + g_hi + (a_lo - h7_lo) / 4294967296) % 4294967296
                    a_lo = h8_lo + h_lo
                    h8_lo = a_lo % 4294967296
                    h8_hi = (h8_hi + h_hi + (a_lo - h8_lo) / 4294967296) % 4294967296
                end

                H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8] = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo
                H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8] = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi
            end
            local function md5_feed_64(H, str, offs, size)
                local W, K, md5_next_shift = common_W, md5_K, md5_next_shift
                local h1, h2, h3, h4 = H[1], H[2], H[3], H[4]

                for pos = offs, offs + size - 1, 64 do
                    for j = 1, 16 do
                        pos = pos + 4

                        local a, b, c, d = string.byte(str, pos - 3, pos)

                        W[j] = ((d * 256 + c) * 256 + b) * 256 + a
                    end

                    local a, b, c, d = h1, h2, h3, h4
                    local s = 25

                    for j = 1, 16 do
                        local F = bit32_rrotate(bit32_band(b, c) + bit32_band(-1 - b, d) + a + K[j] + W[j], s) + b

                        s = md5_next_shift[s]
                        a = d
                        d = c
                        c = b
                        b = F
                    end

                    s = 27

                    for j = 17, 32 do
                        local F = bit32_rrotate(bit32_band(d, b) + bit32_band(-1 - d, c) + a + K[j] + W[(5 * j - 4) % 16 + 1], s) + b

                        s = md5_next_shift[s]
                        a = d
                        d = c
                        c = b
                        b = F
                    end

                    s = 28

                    for j = 33, 48 do
                        local F = bit32_rrotate(bit32_bxor(bit32_bxor(b, c), d) + a + K[j] + W[(3 * j + 2) % 16 + 1], s) + b

                        s = md5_next_shift[s]
                        a = d
                        d = c
                        c = b
                        b = F
                    end

                    s = 26

                    for j = 49, 64 do
                        local F = bit32_rrotate(bit32_bxor(c, bit32_bor(b, -1 - d)) + a + K[j] + W[(j * 7 - 7) % 16 + 1], s) + b

                        s = md5_next_shift[s]
                        a = d
                        d = c
                        c = b
                        b = F
                    end

                    h1 = (a + h1) % 4294967296
                    h2 = (b + h2) % 4294967296
                    h3 = (c + h3) % 4294967296
                    h4 = (d + h4) % 4294967296
                end

                H[1], H[2], H[3], H[4] = h1, h2, h3, h4
            end
            local function sha1_feed_64(H, str, offs, size)
                local W = common_W
                local h1, h2, h3, h4, h5 = H[1], H[2], H[3], H[4], H[5]

                for pos = offs, offs + size - 1, 64 do
                    for j = 1, 16 do
                        pos = pos + 4

                        local a, b, c, d = string.byte(str, pos - 3, pos)

                        W[j] = ((a * 256 + b) * 256 + c) * 256 + d
                    end
                    for j = 17, 80 do
                        W[j] = bit32_lrotate(bit32_bxor(W[j - 3], W[j - 8], W[j - 14], W[j - 16]), 1)
                    end

                    local a, b, c, d, e = h1, h2, h3, h4, h5

                    for j = 1, 20 do
                        local z = bit32_lrotate(a, 5) + bit32_band(b, c) + bit32_band(
-1 - b, d) + 0x5a827999 + W[j] + e

                        e = d
                        d = c
                        c = bit32_rrotate(b, 2)
                        b = a
                        a = z
                    end
                    for j = 21, 40 do
                        local z = bit32_lrotate(a, 5) + bit32_bxor(b, c, d) + 0x6ed9eba1 + W[j] + e

                        e = d
                        d = c
                        c = bit32_rrotate(b, 2)
                        b = a
                        a = z
                    end
                    for j = 41, 60 do
                        local z = bit32_lrotate(a, 5) + bit32_band(d, c) + bit32_band(b, bit32_bxor(d, c)) + 0x8f1bbcdc + W[j] + e

                        e = d
                        d = c
                        c = bit32_rrotate(b, 2)
                        b = a
                        a = z
                    end
                    for j = 61, 80 do
                        local z = bit32_lrotate(a, 5) + bit32_bxor(b, c, d) + 0xca62c1d6 + W[j] + e

                        e = d
                        d = c
                        c = bit32_rrotate(b, 2)
                        b = a
                        a = z
                    end

                    h1 = (a + h1) % 4294967296
                    h2 = (b + h2) % 4294967296
                    h3 = (c + h3) % 4294967296
                    h4 = (d + h4) % 4294967296
                    h5 = (e + h5) % 4294967296
                end

                H[1], H[2], H[3], H[4], H[5] = h1, h2, h3, h4, h5
            end
            local function keccak_feed(
                lanes_lo,
                lanes_hi,
                str,
                offs,
                size,
                block_size_in_bytes
            )
                local RC_lo, RC_hi = sha3_RC_lo, sha3_RC_hi
                local qwords_qty = block_size_in_bytes / 8

                for pos = offs, offs + size - 1, block_size_in_bytes do
                    for j = 1, qwords_qty do
                        local a, b, c, d = string.byte(str, pos + 1, pos + 4)

                        lanes_lo[j] = bit32_bxor(lanes_lo[j], ((d * 256 + c) * 256 + b) * 256 + a)
                        pos = pos + 8
                        a, b, c, d = string.byte(str, pos - 3, pos)
                        lanes_hi[j] = bit32_bxor(lanes_hi[j], ((d * 256 + c) * 256 + b) * 256 + a)
                    end

                    local L01_lo, L01_hi, L02_lo, L02_hi, L03_lo, L03_hi, L04_lo, L04_hi, L05_lo, L05_hi, L06_lo, L06_hi, L07_lo, L07_hi, L08_lo, L08_hi, L09_lo, L09_hi, L10_lo, L10_hi, L11_lo, L11_hi, L12_lo, L12_hi, L13_lo, L13_hi, L14_lo, L14_hi, L15_lo, L15_hi, L16_lo, L16_hi, L17_lo, L17_hi, L18_lo, L18_hi, L19_lo, L19_hi, L20_lo, L20_hi, L21_lo, L21_hi, L22_lo, L22_hi, L23_lo, L23_hi, L24_lo, L24_hi, L25_lo, L25_hi = lanes_lo[1], lanes_hi[1], lanes_lo[2], lanes_hi[2], lanes_lo[3], lanes_hi[3], lanes_lo[4], lanes_hi[4], lanes_lo[5], lanes_hi[5], lanes_lo[6], lanes_hi[6], lanes_lo[7], lanes_hi[7], lanes_lo[8], lanes_hi[8], lanes_lo[9], lanes_hi[9], lanes_lo[10], lanes_hi[10], lanes_lo[11], lanes_hi[11], lanes_lo[12], lanes_hi[12], lanes_lo[13], lanes_hi[13], lanes_lo[14], lanes_hi[14], lanes_lo[15], lanes_hi[15], lanes_lo[16], lanes_hi[16], lanes_lo[17], lanes_hi[17], lanes_lo[18], lanes_hi[18], lanes_lo[19], lanes_hi[19], lanes_lo[20], lanes_hi[20], lanes_lo[21], lanes_hi[21], lanes_lo[22], lanes_hi[22], lanes_lo[23], lanes_hi[23], lanes_lo[24], lanes_hi[24], lanes_lo[25], lanes_hi[25]

                    for round_idx = 1, 24 do
                        local C1_lo = bit32_bxor(L01_lo, L06_lo, L11_lo, L16_lo, L21_lo)
                        local C1_hi = bit32_bxor(L01_hi, L06_hi, L11_hi, L16_hi, L21_hi)
                        local C2_lo = bit32_bxor(L02_lo, L07_lo, L12_lo, L17_lo, L22_lo)
                        local C2_hi = bit32_bxor(L02_hi, L07_hi, L12_hi, L17_hi, L22_hi)
                        local C3_lo = bit32_bxor(L03_lo, L08_lo, L13_lo, L18_lo, L23_lo)
                        local C3_hi = bit32_bxor(L03_hi, L08_hi, L13_hi, L18_hi, L23_hi)
                        local C4_lo = bit32_bxor(L04_lo, L09_lo, L14_lo, L19_lo, L24_lo)
                        local C4_hi = bit32_bxor(L04_hi, L09_hi, L14_hi, L19_hi, L24_hi)
                        local C5_lo = bit32_bxor(L05_lo, L10_lo, L15_lo, L20_lo, L25_lo)
                        local C5_hi = bit32_bxor(L05_hi, L10_hi, L15_hi, L20_hi, L25_hi)
                        local D_lo = bit32_bxor(C1_lo, C3_lo * 2 + (C3_hi % TWO_POW_32 - C3_hi % TWO_POW_31) / TWO_POW_31)
                        local D_hi = bit32_bxor(C1_hi, C3_hi * 2 + (C3_lo % TWO_POW_32 - C3_lo % TWO_POW_31) / TWO_POW_31)
                        local T0_lo = bit32_bxor(D_lo, L02_lo)
                        local T0_hi = bit32_bxor(D_hi, L02_hi)
                        local T1_lo = bit32_bxor(D_lo, L07_lo)
                        local T1_hi = bit32_bxor(D_hi, L07_hi)
                        local T2_lo = bit32_bxor(D_lo, L12_lo)
                        local T2_hi = bit32_bxor(D_hi, L12_hi)
                        local T3_lo = bit32_bxor(D_lo, L17_lo)
                        local T3_hi = bit32_bxor(D_hi, L17_hi)
                        local T4_lo = bit32_bxor(D_lo, L22_lo)
                        local T4_hi = bit32_bxor(D_hi, L22_hi)

                        L02_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_20) / TWO_POW_20 + T1_hi * TWO_POW_12
                        L02_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_20) / TWO_POW_20 + T1_lo * TWO_POW_12
                        L07_lo = (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_19) / TWO_POW_19 + T3_hi * TWO_POW_13
                        L07_hi = (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_19) / TWO_POW_19 + T3_lo * TWO_POW_13
                        L12_lo = T0_lo * 2 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_31) / TWO_POW_31
                        L12_hi = T0_hi * 2 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_31) / TWO_POW_31
                        L17_lo = T2_lo * TWO_POW_10 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_22) / TWO_POW_22
                        L17_hi = T2_hi * TWO_POW_10 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_22) / TWO_POW_22
                        L22_lo = T4_lo * TWO_POW_2 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_30) / TWO_POW_30
                        L22_hi = T4_hi * TWO_POW_2 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_30) / TWO_POW_30
                        D_lo = bit32_bxor(C2_lo, C4_lo * 2 + (C4_hi % TWO_POW_32 - C4_hi % TWO_POW_31) / TWO_POW_31)
                        D_hi = bit32_bxor(C2_hi, C4_hi * 2 + (C4_lo % TWO_POW_32 - C4_lo % TWO_POW_31) / TWO_POW_31)
                        T0_lo = bit32_bxor(D_lo, L03_lo)
                        T0_hi = bit32_bxor(D_hi, L03_hi)
                        T1_lo = bit32_bxor(D_lo, L08_lo)
                        T1_hi = bit32_bxor(D_hi, L08_hi)
                        T2_lo = bit32_bxor(D_lo, L13_lo)
                        T2_hi = bit32_bxor(D_hi, L13_hi)
                        T3_lo = bit32_bxor(D_lo, L18_lo)
                        T3_hi = bit32_bxor(D_hi, L18_hi)
                        T4_lo = bit32_bxor(D_lo, L23_lo)
                        T4_hi = bit32_bxor(D_hi, L23_hi)
                        L03_lo = (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_21) / TWO_POW_21 + T2_hi * TWO_POW_11
                        L03_hi = (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_21) / TWO_POW_21 + T2_lo * TWO_POW_11
                        L08_lo = (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_3) / TWO_POW_3 + T4_hi * TWO_POW_29 % TWO_POW_32
                        L08_hi = (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_3) / TWO_POW_3 + T4_lo * TWO_POW_29 % TWO_POW_32
                        L13_lo = T1_lo * TWO_POW_6 + (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_26) / TWO_POW_26
                        L13_hi = T1_hi * TWO_POW_6 + (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_26) / TWO_POW_26
                        L18_lo = T3_lo * TWO_POW_15 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_17) / TWO_POW_17
                        L18_hi = T3_hi * TWO_POW_15 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_17) / TWO_POW_17
                        L23_lo = (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_2) / TWO_POW_2 + T0_hi * TWO_POW_30 % TWO_POW_32
                        L23_hi = (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_2) / TWO_POW_2 + T0_lo * TWO_POW_30 % TWO_POW_32
                        D_lo = bit32_bxor(C3_lo, C5_lo * 2 + (C5_hi % TWO_POW_32 - C5_hi % TWO_POW_31) / TWO_POW_31)
                        D_hi = bit32_bxor(C3_hi, C5_hi * 2 + (C5_lo % TWO_POW_32 - C5_lo % TWO_POW_31) / TWO_POW_31)
                        T0_lo = bit32_bxor(D_lo, L04_lo)
                        T0_hi = bit32_bxor(D_hi, L04_hi)
                        T1_lo = bit32_bxor(D_lo, L09_lo)
                        T1_hi = bit32_bxor(D_hi, L09_hi)
                        T2_lo = bit32_bxor(D_lo, L14_lo)
                        T2_hi = bit32_bxor(D_hi, L14_hi)
                        T3_lo = bit32_bxor(D_lo, L19_lo)
                        T3_hi = bit32_bxor(D_hi, L19_hi)
                        T4_lo = bit32_bxor(D_lo, L24_lo)
                        T4_hi = bit32_bxor(D_hi, L24_hi)
                        L04_lo = T3_lo * TWO_POW_21 % TWO_POW_32 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_11) / TWO_POW_11
                        L04_hi = T3_hi * TWO_POW_21 % TWO_POW_32 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_11) / TWO_POW_11
                        L09_lo = T0_lo * TWO_POW_28 % TWO_POW_32 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_4) / TWO_POW_4
                        L09_hi = T0_hi * TWO_POW_28 % TWO_POW_32 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_4) / TWO_POW_4
                        L14_lo = T2_lo * TWO_POW_25 % TWO_POW_32 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_7) / TWO_POW_7
                        L14_hi = T2_hi * TWO_POW_25 % TWO_POW_32 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_7) / TWO_POW_7
                        L19_lo = (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_8) / TWO_POW_8 + T4_hi * TWO_POW_24 % TWO_POW_32
                        L19_hi = (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_8) / TWO_POW_8 + T4_lo * TWO_POW_24 % TWO_POW_32
                        L24_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_9) / TWO_POW_9 + T1_hi * TWO_POW_23 % TWO_POW_32
                        L24_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_9) / TWO_POW_9 + T1_lo * TWO_POW_23 % TWO_POW_32
                        D_lo = bit32_bxor(C4_lo, C1_lo * 2 + (C1_hi % TWO_POW_32 - C1_hi % TWO_POW_31) / TWO_POW_31)
                        D_hi = bit32_bxor(C4_hi, C1_hi * 2 + (C1_lo % TWO_POW_32 - C1_lo % TWO_POW_31) / TWO_POW_31)
                        T0_lo = bit32_bxor(D_lo, L05_lo)
                        T0_hi = bit32_bxor(D_hi, L05_hi)
                        T1_lo = bit32_bxor(D_lo, L10_lo)
                        T1_hi = bit32_bxor(D_hi, L10_hi)
                        T2_lo = bit32_bxor(D_lo, L15_lo)
                        T2_hi = bit32_bxor(D_hi, L15_hi)
                        T3_lo = bit32_bxor(D_lo, L20_lo)
                        T3_hi = bit32_bxor(D_hi, L20_hi)
                        T4_lo = bit32_bxor(D_lo, L25_lo)
                        T4_hi = bit32_bxor(D_hi, L25_hi)
                        L05_lo = T4_lo * TWO_POW_14 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_18) / TWO_POW_18
                        L05_hi = T4_hi * TWO_POW_14 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_18) / TWO_POW_18
                        L10_lo = T1_lo * TWO_POW_20 % TWO_POW_32 + (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_12) / TWO_POW_12
                        L10_hi = T1_hi * TWO_POW_20 % TWO_POW_32 + (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_12) / TWO_POW_12
                        L15_lo = T3_lo * TWO_POW_8 + (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_24) / TWO_POW_24
                        L15_hi = T3_hi * TWO_POW_8 + (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_24) / TWO_POW_24
                        L20_lo = T0_lo * TWO_POW_27 % TWO_POW_32 + (T0_hi % TWO_POW_32 - T0_hi % TWO_POW_5) / TWO_POW_5
                        L20_hi = T0_hi * TWO_POW_27 % TWO_POW_32 + (T0_lo % TWO_POW_32 - T0_lo % TWO_POW_5) / TWO_POW_5
                        L25_lo = (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_25) / TWO_POW_25 + T2_hi * TWO_POW_7
                        L25_hi = (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_25) / TWO_POW_25 + T2_lo * TWO_POW_7
                        D_lo = bit32_bxor(C5_lo, C2_lo * 2 + (C2_hi % TWO_POW_32 - C2_hi % TWO_POW_31) / TWO_POW_31)
                        D_hi = bit32_bxor(C5_hi, C2_hi * 2 + (C2_lo % TWO_POW_32 - C2_lo % TWO_POW_31) / TWO_POW_31)
                        T1_lo = bit32_bxor(D_lo, L06_lo)
                        T1_hi = bit32_bxor(D_hi, L06_hi)
                        T2_lo = bit32_bxor(D_lo, L11_lo)
                        T2_hi = bit32_bxor(D_hi, L11_hi)
                        T3_lo = bit32_bxor(D_lo, L16_lo)
                        T3_hi = bit32_bxor(D_hi, L16_hi)
                        T4_lo = bit32_bxor(D_lo, L21_lo)
                        T4_hi = bit32_bxor(D_hi, L21_hi)
                        L06_lo = T2_lo * TWO_POW_3 + (T2_hi % TWO_POW_32 - T2_hi % TWO_POW_29) / TWO_POW_29
                        L06_hi = T2_hi * TWO_POW_3 + (T2_lo % TWO_POW_32 - T2_lo % TWO_POW_29) / TWO_POW_29
                        L11_lo = T4_lo * TWO_POW_18 + (T4_hi % TWO_POW_32 - T4_hi % TWO_POW_14) / TWO_POW_14
                        L11_hi = T4_hi * TWO_POW_18 + (T4_lo % TWO_POW_32 - T4_lo % TWO_POW_14) / TWO_POW_14
                        L16_lo = (T1_lo % TWO_POW_32 - T1_lo % TWO_POW_28) / TWO_POW_28 + T1_hi * TWO_POW_4
                        L16_hi = (T1_hi % TWO_POW_32 - T1_hi % TWO_POW_28) / TWO_POW_28 + T1_lo * TWO_POW_4
                        L21_lo = (T3_lo % TWO_POW_32 - T3_lo % TWO_POW_23) / TWO_POW_23 + T3_hi * TWO_POW_9
                        L21_hi = (T3_hi % TWO_POW_32 - T3_hi % TWO_POW_23) / TWO_POW_23 + T3_lo * TWO_POW_9
                        L01_lo = bit32_bxor(D_lo, L01_lo)
                        L01_hi = bit32_bxor(D_hi, L01_hi)
                        L01_lo, L02_lo, L03_lo, L04_lo, L05_lo = bit32_bxor(L01_lo, bit32_band(
-1 - L02_lo, L03_lo)), bit32_bxor(L02_lo, bit32_band(-1 - L03_lo, L04_lo)), bit32_bxor(L03_lo, bit32_band(
-1 - L04_lo, L05_lo)), bit32_bxor(L04_lo, bit32_band(-1 - L05_lo, L01_lo)), bit32_bxor(L05_lo, bit32_band(
-1 - L01_lo, L02_lo))
                        L01_hi, L02_hi, L03_hi, L04_hi, L05_hi = bit32_bxor(L01_hi, bit32_band(
-1 - L02_hi, L03_hi)), bit32_bxor(L02_hi, bit32_band(-1 - L03_hi, L04_hi)), bit32_bxor(L03_hi, bit32_band(
-1 - L04_hi, L05_hi)), bit32_bxor(L04_hi, bit32_band(-1 - L05_hi, L01_hi)), bit32_bxor(L05_hi, bit32_band(
-1 - L01_hi, L02_hi))
                        L06_lo, L07_lo, L08_lo, L09_lo, L10_lo = bit32_bxor(L09_lo, bit32_band(
-1 - L10_lo, L06_lo)), bit32_bxor(L10_lo, bit32_band(-1 - L06_lo, L07_lo)), bit32_bxor(L06_lo, bit32_band(
-1 - L07_lo, L08_lo)), bit32_bxor(L07_lo, bit32_band(-1 - L08_lo, L09_lo)), bit32_bxor(L08_lo, bit32_band(
-1 - L09_lo, L10_lo))
                        L06_hi, L07_hi, L08_hi, L09_hi, L10_hi = bit32_bxor(L09_hi, bit32_band(
-1 - L10_hi, L06_hi)), bit32_bxor(L10_hi, bit32_band(-1 - L06_hi, L07_hi)), bit32_bxor(L06_hi, bit32_band(
-1 - L07_hi, L08_hi)), bit32_bxor(L07_hi, bit32_band(-1 - L08_hi, L09_hi)), bit32_bxor(L08_hi, bit32_band(
-1 - L09_hi, L10_hi))
                        L11_lo, L12_lo, L13_lo, L14_lo, L15_lo = bit32_bxor(L12_lo, bit32_band(
-1 - L13_lo, L14_lo)), bit32_bxor(L13_lo, bit32_band(-1 - L14_lo, L15_lo)), bit32_bxor(L14_lo, bit32_band(
-1 - L15_lo, L11_lo)), bit32_bxor(L15_lo, bit32_band(-1 - L11_lo, L12_lo)), bit32_bxor(L11_lo, bit32_band(
-1 - L12_lo, L13_lo))
                        L11_hi, L12_hi, L13_hi, L14_hi, L15_hi = bit32_bxor(L12_hi, bit32_band(
-1 - L13_hi, L14_hi)), bit32_bxor(L13_hi, bit32_band(-1 - L14_hi, L15_hi)), bit32_bxor(L14_hi, bit32_band(
-1 - L15_hi, L11_hi)), bit32_bxor(L15_hi, bit32_band(-1 - L11_hi, L12_hi)), bit32_bxor(L11_hi, bit32_band(
-1 - L12_hi, L13_hi))
                        L16_lo, L17_lo, L18_lo, L19_lo, L20_lo = bit32_bxor(L20_lo, bit32_band(
-1 - L16_lo, L17_lo)), bit32_bxor(L16_lo, bit32_band(-1 - L17_lo, L18_lo)), bit32_bxor(L17_lo, bit32_band(
-1 - L18_lo, L19_lo)), bit32_bxor(L18_lo, bit32_band(-1 - L19_lo, L20_lo)), bit32_bxor(L19_lo, bit32_band(
-1 - L20_lo, L16_lo))
                        L16_hi, L17_hi, L18_hi, L19_hi, L20_hi = bit32_bxor(L20_hi, bit32_band(
-1 - L16_hi, L17_hi)), bit32_bxor(L16_hi, bit32_band(-1 - L17_hi, L18_hi)), bit32_bxor(L17_hi, bit32_band(
-1 - L18_hi, L19_hi)), bit32_bxor(L18_hi, bit32_band(-1 - L19_hi, L20_hi)), bit32_bxor(L19_hi, bit32_band(
-1 - L20_hi, L16_hi))
                        L21_lo, L22_lo, L23_lo, L24_lo, L25_lo = bit32_bxor(L23_lo, bit32_band(
-1 - L24_lo, L25_lo)), bit32_bxor(L24_lo, bit32_band(-1 - L25_lo, L21_lo)), bit32_bxor(L25_lo, bit32_band(
-1 - L21_lo, L22_lo)), bit32_bxor(L21_lo, bit32_band(-1 - L22_lo, L23_lo)), bit32_bxor(L22_lo, bit32_band(
-1 - L23_lo, L24_lo))
                        L21_hi, L22_hi, L23_hi, L24_hi, L25_hi = bit32_bxor(L23_hi, bit32_band(
-1 - L24_hi, L25_hi)), bit32_bxor(L24_hi, bit32_band(-1 - L25_hi, L21_hi)), bit32_bxor(L25_hi, bit32_band(
-1 - L21_hi, L22_hi)), bit32_bxor(L21_hi, bit32_band(-1 - L22_hi, L23_hi)), bit32_bxor(L22_hi, bit32_band(
-1 - L23_hi, L24_hi))
                        L01_lo = bit32_bxor(L01_lo, RC_lo[round_idx])
                        L01_hi = L01_hi + RC_hi[round_idx]
                    end

                    lanes_lo[1] = L01_lo
                    lanes_hi[1] = L01_hi
                    lanes_lo[2] = L02_lo
                    lanes_hi[2] = L02_hi
                    lanes_lo[3] = L03_lo
                    lanes_hi[3] = L03_hi
                    lanes_lo[4] = L04_lo
                    lanes_hi[4] = L04_hi
                    lanes_lo[5] = L05_lo
                    lanes_hi[5] = L05_hi
                    lanes_lo[6] = L06_lo
                    lanes_hi[6] = L06_hi
                    lanes_lo[7] = L07_lo
                    lanes_hi[7] = L07_hi
                    lanes_lo[8] = L08_lo
                    lanes_hi[8] = L08_hi
                    lanes_lo[9] = L09_lo
                    lanes_hi[9] = L09_hi
                    lanes_lo[10] = L10_lo
                    lanes_hi[10] = L10_hi
                    lanes_lo[11] = L11_lo
                    lanes_hi[11] = L11_hi
                    lanes_lo[12] = L12_lo
                    lanes_hi[12] = L12_hi
                    lanes_lo[13] = L13_lo
                    lanes_hi[13] = L13_hi
                    lanes_lo[14] = L14_lo
                    lanes_hi[14] = L14_hi
                    lanes_lo[15] = L15_lo
                    lanes_hi[15] = L15_hi
                    lanes_lo[16] = L16_lo
                    lanes_hi[16] = L16_hi
                    lanes_lo[17] = L17_lo
                    lanes_hi[17] = L17_hi
                    lanes_lo[18] = L18_lo
                    lanes_hi[18] = L18_hi
                    lanes_lo[19] = L19_lo
                    lanes_hi[19] = L19_hi
                    lanes_lo[20] = L20_lo
                    lanes_hi[20] = L20_hi
                    lanes_lo[21] = L21_lo
                    lanes_hi[21] = L21_hi
                    lanes_lo[22] = L22_lo
                    lanes_hi[22] = L22_hi
                    lanes_lo[23] = L23_lo
                    lanes_hi[23] = L23_hi
                    lanes_lo[24] = L24_lo
                    lanes_hi[24] = L24_hi
                    lanes_lo[25] = L25_lo
                    lanes_hi[25] = L25_hi
                end
            end

            do
                local function mul(src1, src2, factor, result_length)
                    local result, carry, value, weight = table.create(result_length), 0, 0, 1

                    for j = 1, result_length do
                        for k = math.max(1, j + 1 - #src2), math.min(j, #src1)do
                            carry = carry + factor * src1[k] * src2[j + 1 - k]
                        end

                        local digit = carry % TWO_POW_24

                        result[j] = math.floor(digit)
                        carry = (carry - digit) / TWO_POW_24
                        value = value + digit * weight
                        weight = weight * TWO_POW_24
                    end

                    return result, value
                end

                local idx, step, p, one, sqrt_hi, sqrt_lo = 0, {
                    4,
                    1,
                    2,
                    -2,
                    2,
                }, 4, {1}, sha2_H_hi, sha2_H_lo

                repeat
                    p = p + step[p % 6]

                    local d = 1

                    repeat
                        d = d + step[d % 6]

                        if d * d > p then
                            local root = p ^ (0.3333333333333333)
                            local R = root * TWO_POW_40

                            R = mul(table.create(1, math.floor(R)), one, 1, 2)

                            local _, delta = mul(R, mul(R, R, 1, 4), -1, 4)
                            local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256)
                            local lo = R[1] % 256 * 16777216 + math.floor(delta * (TWO_POW_NEG_56 / 3) * root / p)

                            if idx < 16 then
                                root = math.sqrt(p)
                                R = root * TWO_POW_40
                                R = mul(table.create(1, math.floor(R)), one, 1, 2)
                                _, delta = mul(R, R, -1, 2)

                                local hi = R[2] % 65536 * 65536 + math.floor(R[1] / 256)
                                local lo = R[1] % 256 * 16777216 + math.floor(delta * TWO_POW_NEG_17 / root)
                                local idx = idx % 8 + 1

                                sha2_H_ext256[224][idx] = lo
                                sqrt_hi[idx], sqrt_lo[idx] = hi, lo + hi * hi_factor

                                if idx > 7 then
                                    sqrt_hi, sqrt_lo = sha2_H_ext512_hi[384], sha2_H_ext512_lo[384]
                                end
                            end

                            idx = idx + 1
                            sha2_K_hi[idx], sha2_K_lo[idx] = hi, lo % K_lo_modulo + hi * hi_factor

                            break
                        end
                    until p % d == 0
                until idx > 79
            end

            for width = 224, 256, 32 do
                local H_lo, H_hi = {}

                if XOR64A5 then
                    for j = 1, 8 do
                        H_lo[j] = XOR64A5(sha2_H_lo[j])
                    end
                else
                    H_hi = {}

                    for j = 1, 8 do
                        H_lo[j] = bit32_bxor(sha2_H_lo[j], 0xa5a5a5a5) % 4294967296
                        H_hi[j] = bit32_bxor(sha2_H_hi[j], 0xa5a5a5a5) % 4294967296
                    end
                end

                sha512_feed_128(H_lo, H_hi, 'SHA-512/' .. tostring(width) .. '\128' .. string.rep('\0', 115) .. 'X', 0, 128)

                sha2_H_ext512_lo[width] = H_lo
                sha2_H_ext512_hi[width] = H_hi
            end

            do
                for idx = 1, 64 do
                    local hi, lo = math.modf(math.abs(math.sin(idx)) * TWO_POW_16)

                    md5_K[idx] = hi * 65536 + math.floor(lo * TWO_POW_16)
                end
            end
            do
                local sh_reg = 29

                local function next_bit()
                    local r = sh_reg % 2

                    sh_reg = bit32_bxor((sh_reg - r) / 2, 142 * r)

                    return r
                end

                for idx = 1, 24 do
                    local lo, m = 0

                    for _ = 1, 6 do
                        m = m and m * m * 2 or 1
                        lo = lo + next_bit() * m
                    end

                    local hi = next_bit() * m

                    sha3_RC_hi[idx], sha3_RC_lo[idx] = hi, lo + hi * hi_factor_keccak
                end
            end

            local function sha256ext(width, message)
                local Array256 = sha2_H_ext256[width]
                local length, tail = 0, ''
                local H = table.create(8)

                H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] = Array256[1], Array256[2], Array256[3], Array256[4], Array256[5], Array256[6], Array256[7], Array256[8]

                local function partial(message_part)
                    if message_part then
                        local partLength = #message_part

                        if tail then
                            length = length + partLength

                            local offs = 0
                            local tailLength = #tail

                            if tail ~= '' and tailLength + partLength >= 64 then
                                offs = 64 - tailLength

                                sha256_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64)

                                tail = ''
                            end

                            local size = partLength - offs
                            local size_tail = size % 64

                            sha256_feed_64(H, message_part, offs, size - size_tail)

                            tail = tail .. string.sub(message_part, partLength + 1 - size_tail)

                            return partial
                        else
                            error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                        end
                    else
                        if tail then
                            local final_blocks = table.create(10)

                            final_blocks[1] = tail
                            final_blocks[2] = '\128'
                            final_blocks[3] = string.rep('\0', (-9 - length) % 64 + 1)
                            tail = nil
                            length = length * (8 / TWO56_POW_7)

                            for j = 4, 10 do
                                length = length % 1 * 256
                                final_blocks[j] = string.char(math.floor(length))
                            end

                            final_blocks = table.concat(final_blocks)

                            sha256_feed_64(H, final_blocks, 0, #final_blocks)

                            local max_reg = width / 32

                            for j = 1, max_reg do
                                H[j] = string.format('%08x', H[j] % 4294967296)
                            end

                            H = table.concat(H, '', 1, max_reg)
                        end

                        return H
                    end
                end

                if message then
                    return partial(message)()
                else
                    return partial
                end
            end
            local function sha512ext(width, message)
                local length, tail, H_lo, H_hi = 0, '', table.pack(table.unpack(sha2_H_ext512_lo[width])), not HEX64 and table.pack(table.unpack(sha2_H_ext512_hi[width]))

                local function partial(message_part)
                    if message_part then
                        local partLength = #message_part

                        if tail then
                            length = length + partLength

                            local offs = 0

                            if tail ~= '' and #tail + partLength >= 128 then
                                offs = 128 - #tail

                                sha512_feed_128(H_lo, H_hi, tail .. string.sub(message_part, 1, offs), 0, 128)

                                tail = ''
                            end

                            local size = partLength - offs
                            local size_tail = size % 128

                            sha512_feed_128(H_lo, H_hi, message_part, offs, size - size_tail)

                            tail = tail .. string.sub(message_part, partLength + 1 - size_tail)

                            return partial
                        else
                            error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                        end
                    else
                        if tail then
                            local final_blocks = table.create(3)

                            final_blocks[1] = tail
                            final_blocks[2] = '\128'
                            final_blocks[3] = string.rep('\0', (-17 - length) % 128 + 9)
                            tail = nil
                            length = length * (8 / TWO56_POW_7)

                            for j = 4, 10 do
                                length = length % 1 * 256
                                final_blocks[j] = string.char(math.floor(length))
                            end

                            final_blocks = table.concat(final_blocks)

                            sha512_feed_128(H_lo, H_hi, final_blocks, 0, #final_blocks)

                            local max_reg = math.ceil(width / 64)

                            if HEX64 then
                                for j = 1, max_reg do
                                    H_lo[j] = HEX64(H_lo[j])
                                end
                            else
                                for j = 1, max_reg do
                                    H_lo[j] = string.format('%08x', H_hi[j] % 4294967296) .. string.format('%08x', H_lo[j] % 4294967296)
                                end

                                H_hi = nil
                            end

                            H_lo = string.sub(table.concat(H_lo, '', 1, max_reg), 1, width / 4)
                        end

                        return H_lo
                    end
                end

                if message then
                    return partial(message)()
                else
                    return partial
                end
            end
            local function md5(message)
                local H, length, tail = table.create(4), 0, ''

                H[1], H[2], H[3], H[4] = md5_sha1_H[1], md5_sha1_H[2], md5_sha1_H[3], md5_sha1_H[4]

                local function partial(message_part)
                    if message_part then
                        local partLength = #message_part

                        if tail then
                            length = length + partLength

                            local offs = 0

                            if tail ~= '' and #tail + partLength >= 64 then
                                offs = 64 - #tail

                                md5_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64)

                                tail = ''
                            end

                            local size = partLength - offs
                            local size_tail = size % 64

                            md5_feed_64(H, message_part, offs, size - size_tail)

                            tail = tail .. string.sub(message_part, partLength + 1 - size_tail)

                            return partial
                        else
                            error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                        end
                    else
                        if tail then
                            local final_blocks = table.create(3)

                            final_blocks[1] = tail
                            final_blocks[2] = '\128'
                            final_blocks[3] = string.rep('\0', (-9 - length) % 64)
                            tail = nil
                            length = length * 8

                            for j = 4, 11 do
                                local low_byte = length % 256

                                final_blocks[j] = string.char(low_byte)
                                length = (length - low_byte) / 256
                            end

                            final_blocks = table.concat(final_blocks)

                            md5_feed_64(H, final_blocks, 0, #final_blocks)

                            for j = 1, 4 do
                                H[j] = string.format('%08x', H[j] % 4294967296)
                            end

                            H = string.gsub(table.concat(H), '(..)(..)(..)(..)', '%4%3%2%1')
                        end

                        return H
                    end
                end

                if message then
                    return partial(message)()
                else
                    return partial
                end
            end
            local function sha1(message)
                local H, length, tail = table.pack(table.unpack(md5_sha1_H)), 0, ''

                local function partial(message_part)
                    if message_part then
                        local partLength = #message_part

                        if tail then
                            length = length + partLength

                            local offs = 0

                            if tail ~= '' and #tail + partLength >= 64 then
                                offs = 64 - #tail

                                sha1_feed_64(H, tail .. string.sub(message_part, 1, offs), 0, 64)

                                tail = ''
                            end

                            local size = partLength - offs
                            local size_tail = size % 64

                            sha1_feed_64(H, message_part, offs, size - size_tail)

                            tail = tail .. string.sub(message_part, partLength + 1 - size_tail)

                            return partial
                        else
                            error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                        end
                    else
                        if tail then
                            local final_blocks = table.create(10)

                            final_blocks[1] = tail
                            final_blocks[2] = '\128'
                            final_blocks[3] = string.rep('\0', (-9 - length) % 64 + 1)
                            tail = nil
                            length = length * (8 / TWO56_POW_7)

                            for j = 4, 10 do
                                length = length % 1 * 256
                                final_blocks[j] = string.char(math.floor(length))
                            end

                            final_blocks = table.concat(final_blocks)

                            sha1_feed_64(H, final_blocks, 0, #final_blocks)

                            for j = 1, 5 do
                                H[j] = string.format('%08x', H[j] % 4294967296)
                            end

                            H = table.concat(H)
                        end

                        return H
                    end
                end

                if message then
                    return partial(message)()
                else
                    return partial
                end
            end
            local function keccak(
                block_size_in_bytes,
                digest_size_in_bytes,
                is_SHAKE,
                message
            )
                if type(digest_size_in_bytes) ~= 'number' then
                    error("Argument 'digest_size_in_bytes' must be a number", 2)
                end

                local tail, lanes_lo, lanes_hi = '', table.create(25, 0), hi_factor_keccak == 0 and table.create(25, 0)
                local result

                local function partial(message_part)
                    if message_part then
                        local partLength = #message_part

                        if tail then
                            local offs = 0

                            if tail ~= '' and #tail + partLength >= block_size_in_bytes then
                                offs = block_size_in_bytes - #tail

                                keccak_feed(lanes_lo, lanes_hi, tail .. string.sub(message_part, 1, offs), 0, block_size_in_bytes, block_size_in_bytes)

                                tail = ''
                            end

                            local size = partLength - offs
                            local size_tail = size % block_size_in_bytes

                            keccak_feed(lanes_lo, lanes_hi, message_part, offs, size - size_tail, block_size_in_bytes)

                            tail = tail .. string.sub(message_part, partLength + 1 - size_tail)

                            return partial
                        else
                            error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                        end
                    else
                        if tail then
                            local gap_start = is_SHAKE and 31 or 6

                            tail = tail .. (#tail + 1 == block_size_in_bytes and string.char(gap_start + 128) or string.char(gap_start) .. string.rep('\0', (
-2 - #tail) % block_size_in_bytes) .. '\128')

                            keccak_feed(lanes_lo, lanes_hi, tail, 0, #tail, block_size_in_bytes)

                            tail = nil

                            local lanes_used = 0
                            local total_lanes = math.floor(block_size_in_bytes / 8)
                            local qwords = {}

                            local function get_next_qwords_of_digest(
                                qwords_qty
                            )
                                if lanes_used >= total_lanes then
                                    keccak_feed(lanes_lo, lanes_hi, '\0\0\0\0\0\0\0\0', 0, 8, 8)

                                    lanes_used = 0
                                end

                                qwords_qty = math.floor(math.min(qwords_qty, total_lanes - lanes_used))

                                if hi_factor_keccak ~= 0 then
                                    for j = 1, qwords_qty do
                                        qwords[j] = HEX64(lanes_lo[lanes_used + j - 1 + lanes_index_base])
                                    end
                                else
                                    for j = 1, qwords_qty do
                                        qwords[j] = string.format('%08x', lanes_hi[lanes_used + j] % 4294967296) .. string.format('%08x', lanes_lo[lanes_used + j] % 4294967296)
                                    end
                                end

                                lanes_used = lanes_used + qwords_qty

                                return string.gsub(table.concat(qwords, '', 1, qwords_qty), '(..)(..)(..)(..)(..)(..)(..)(..)', '%8%7%6%5%4%3%2%1'), qwords_qty * 8
                            end

                            local parts = {}
                            local last_part, last_part_size = '', 0

                            local function get_next_part_of_digest(
                                bytes_needed
                            )
                                bytes_needed = bytes_needed or 1

                                if bytes_needed <= last_part_size then
                                    last_part_size = last_part_size - bytes_needed

                                    local part_size_in_nibbles = bytes_needed * 2
                                    local result = string.sub(last_part, 1, part_size_in_nibbles)

                                    last_part = string.sub(last_part, part_size_in_nibbles + 1)

                                    return result
                                end

                                local parts_qty = 0

                                if last_part_size > 0 then
                                    parts_qty = 1
                                    parts[parts_qty] = last_part
                                    bytes_needed = bytes_needed - last_part_size
                                end

                                while bytes_needed >= 8 do
                                    local next_part, next_part_size = get_next_qwords_of_digest(bytes_needed / 8)

                                    parts_qty = parts_qty + 1
                                    parts[parts_qty] = next_part
                                    bytes_needed = bytes_needed - next_part_size
                                end

                                if bytes_needed > 0 then
                                    last_part, last_part_size = get_next_qwords_of_digest(1)
                                    parts_qty = parts_qty + 1
                                    parts[parts_qty] = get_next_part_of_digest(bytes_needed)
                                else
                                    last_part, last_part_size = '', 0
                                end

                                return table.concat(parts, '', 1, parts_qty)
                            end

                            if digest_size_in_bytes < 0 then
                                result = get_next_part_of_digest
                            else
                                result = get_next_part_of_digest(digest_size_in_bytes)
                            end
                        end

                        return result
                    end
                end

                if message then
                    return partial(message)()
                else
                    return partial
                end
            end
            local function HexToBinFunction(hh)
                return string.char(tonumber(hh, 16))
            end
            local function hex2bin(hex_string)
                return (string.gsub(hex_string, '%x%x', HexToBinFunction))
            end

            local base64_symbols = {
                ['+'] = 62,
                ['-'] = 62,
                [62] = '+',
                ['/'] = 63,
                _ = 63,
                [63] = '/',
                ['='] = -1,
                ['.'] = -1,
                [-1] = '=',
            }
            local symbol_index = 0

            for j, pair in ipairs{
                'AZ',
                'az',
                '09',
            }do
                for ascii = string.byte(pair), string.byte(pair, 2)do
                    local ch = string.char(ascii)

                    base64_symbols[ch] = symbol_index
                    base64_symbols[symbol_index] = ch
                    symbol_index = symbol_index + 1
                end
            end

            local function bin2base64(binary_string)
                local stringLength = #binary_string
                local result = table.create(math.ceil(stringLength / 3))
                local length = 0

                for pos = 1, #binary_string, 3 do
                    local c1, c2, c3, c4 = string.byte(string.sub(binary_string, pos, pos + 2) .. '\0', 1, 
-1)

                    length = length + 1
                    result[length] = base64_symbols[math.floor(c1 / 4)] .. base64_symbols[c1 % 4 * 16 + math.floor(c2 / 16)] .. base64_symbols[c3 and c2 % 16 * 4 + math.floor(c3 / 64) or 
-1] .. base64_symbols[c4 and c3 % 64 or -1]
                end

                return table.concat(result)
            end
            local function base642bin(base64_string)
                local result, chars_qty = {}, 3

                for pos, ch in string.gmatch(string.gsub(base64_string, '%s+', ''), '()(.)')do
                    local code = base64_symbols[ch]

                    if code < 0 then
                        chars_qty = chars_qty - 1
                        code = 0
                    end

                    local idx = pos % 4

                    if idx > 0 then
                        result[-idx] = code
                    else
                        local c1 = result[-1] * 4 + math.floor(result[-2] / 16)
                        local c2 = (result[-2] % 16) * 16 + math.floor(result[-3] / 4)
                        local c3 = (result[-3] % 4) * 64 + code

                        result[#result + 1] = string.sub(string.char(c1, c2, c3), 1, chars_qty)
                    end
                end

                return table.concat(result)
            end

            local block_size_for_HMAC
            local BinaryStringMap = {}

            for Index = 0, 255 do
                BinaryStringMap[string.format('%02x', Index)] = string.char(Index)
            end

            local function hmac(hash_func, key, message, AsBinary)
                local block_size = block_size_for_HMAC[hash_func]

                if not block_size then
                    error('Unknown hash function', 2)
                end

                local KeyLength = #key

                if KeyLength > block_size then
                    key = string.gsub(hash_func(key), '%x%x', HexToBinFunction)
                    KeyLength = #key
                end

                local append = hash_func()(string.gsub(key, '.', function(c)
                    return string.char(bit32_bxor(string.byte(c), 0x36))
                end) .. string.rep('6', block_size - KeyLength))
                local result

                local function partial(message_part)
                    if not message_part then
                        result = result or hash_func(string.gsub(key, '.', function(
                            c
                        )
                            return string.char(bit32_bxor(string.byte(c), 0x5c))
                        end) .. string.rep('\\', block_size - KeyLength) .. (string.gsub(append(), '%x%x', HexToBinFunction)))

                        return result
                    elseif result then
                        error(
[[Adding more chunks is not allowed after receiving the result]], 2)
                    else
                        append(message_part)

                        return partial
                    end
                end

                if message then
                    local FinalMessage = partial(message)()

                    return AsBinary and (string.gsub(FinalMessage, '%x%x', BinaryStringMap)) or FinalMessage
                else
                    return partial
                end
            end

            local sha = {
                md5 = md5,
                sha1 = sha1,
                sha224 = function(message)
                    return sha256ext(224, message)
                end,
                sha256 = function(message)
                    return sha256ext(256, message)
                end,
                sha512_224 = function(message)
                    return sha512ext(224, message)
                end,
                sha512_256 = function(message)
                    return sha512ext(256, message)
                end,
                sha384 = function(message)
                    return sha512ext(384, message)
                end,
                sha512 = function(message)
                    return sha512ext(512, message)
                end,
                sha3_224 = function(message)
                    return keccak(144, 28, false, message)
                end,
                sha3_256 = function(message)
                    return keccak(136, 32, false, message)
                end,
                sha3_384 = function(message)
                    return keccak(104, 48, false, message)
                end,
                sha3_512 = function(message)
                    return keccak(72, 64, false, message)
                end,
                shake128 = function(message, digest_size_in_bytes)
                    return keccak(168, digest_size_in_bytes, true, message)
                end,
                shake256 = function(message, digest_size_in_bytes)
                    return keccak(136, digest_size_in_bytes, true, message)
                end,
                hmac = hmac,
                hex_to_bin = hex2bin,
                base64_to_bin = base642bin,
                bin_to_base64 = bin2base64,
                base64_encode = Base64.Encode,
                base64_decode = Base64.Decode,
            }

            block_size_for_HMAC = {
                [sha.md5] = 64,
                [sha.sha1] = 64,
                [sha.sha224] = 64,
                [sha.sha256] = 64,
                [sha.sha512_224] = 128,
                [sha.sha512_256] = 128,
                [sha.sha384] = 128,
                [sha.sha512] = 128,
                [sha.sha3_224] = 144,
                [sha.sha3_256] = 136,
                [sha.sha3_384] = 104,
                [sha.sha3_512] = 72,
            }

            return sha
        end,
    },
    {
        name = 'lz4',
        func = function()
            local lz4 = {}

            local function plainFind(str, pat)
                return string.find(str, pat, 0, true)
            end
            local function streamer(str)
                local Stream = {}

                Stream.Offset = 0
                Stream.Source = str
                Stream.Length = string.len(str)
                Stream.IsFinished = false
                Stream.LastUnreadBytes = 0

                function Stream.read(self, len, shift)
                    local len = len or 1
                    local shift = shift ~= nil and shift or true
                    local dat = string.sub(self.Source, self.Offset + 1, self.Offset + len)
                    local dataLength = string.len(dat)
                    local unreadBytes = len - dataLength

                    if shift then
                        self:seek(len)
                    end

                    self.LastUnreadBytes = unreadBytes

                    return dat
                end
                function Stream.seek(self, len)
                    local len = len or 1

                    self.Offset = math.clamp(self.Offset + len, 0, self.Length)
                    self.IsFinished = self.Offset >= self.Length
                end
                function Stream.append(self, newData)
                    self.Source = self.Source .. newData
                    self.Length = string.len(self.Source)

                    self:seek(0)
                end
                function Stream.toEnd(self)
                    self:seek(self.Length)
                end

                return Stream
            end

            function lz4.compress(str)
                local blocks = {}
                local iostream = streamer(str)

                if iostream.Length > 12 then
                    local firstFour = iostream:read(4)
                    local processed = firstFour
                    local lit = firstFour
                    local match = ''
                    local LiteralPushValue = ''
                    local pushToLiteral = true

                    repeat
                        pushToLiteral = true

                        local nextByte = iostream:read()

                        if plainFind(processed, nextByte) then
                            local next3 = iostream:read(3, false)

                            if string.len(next3) < 3 then
                                LiteralPushValue = nextByte .. next3

                                iostream:seek(3)
                            else
                                match = nextByte .. next3

                                local matchPos = plainFind(processed, match)

                                if matchPos then
                                    iostream:seek(3)

                                    repeat
                                        local nextMatchByte = iostream:read(1, false)
                                        local newResult = match .. nextMatchByte
                                        local repos = plainFind(processed, newResult)

                                        if repos then
                                            match = newResult
                                            matchPos = repos

                                            iostream:seek(1)
                                        end
                                    until not plainFind(processed, newResult) or iostream.IsFinished

                                    local matchLen = string.len(match)
                                    local pushMatch = true

                                    if iostream.Length - iostream.Offset <= 5 then
                                        LiteralPushValue = match
                                        pushMatch = false
                                    end
                                    if pushMatch then
                                        pushToLiteral = false

                                        local realPosition = string.len(processed) - matchPos

                                        processed = processed .. match

                                        table.insert(blocks, {
                                            Literal = lit,
                                            LiteralLength = string.len(lit),
                                            MatchOffset = realPosition + 1,
                                            MatchLength = matchLen,
                                        })

                                        lit = ''
                                    end
                                else
                                    LiteralPushValue = nextByte
                                end
                            end
                        else
                            LiteralPushValue = nextByte
                        end
                        if pushToLiteral then
                            lit = lit .. LiteralPushValue
                            processed = processed .. nextByte
                        end
                    until iostream.IsFinished

                    table.insert(blocks, {
                        Literal = lit,
                        LiteralLength = string.len(lit),
                    })
                else
                    local str = iostream.Source

                    blocks[1] = {
                        Literal = str,
                        LiteralLength = string.len(str),
                    }
                end

                local output = string.rep('\0', 4)

                local function write(char)
                    output = output .. char
                end

                for chunkNum, chunk in blocks do
                    local litLen = chunk.LiteralLength
                    local matLen = (chunk.MatchLength or 4) - 4
                    local tokenLit = math.clamp(litLen, 0, 15)
                    local tokenMat = math.clamp(matLen, 0, 15)
                    local token = bit32.lshift(tokenLit, 4) + tokenMat

                    write(string.pack('<I1', token))

                    if litLen >= 15 then
                        litLen = litLen - 15

                        repeat
                            local nextToken = math.clamp(litLen, 0, 255)

                            write(string.pack('<I1', nextToken))

                            if nextToken == 255 then
                                litLen = litLen - 255
                            end
                        until nextToken < 255
                    end

                    write(chunk.Literal)

                    if chunkNum ~= #blocks then
                        write(string.pack('<I2', chunk.MatchOffset))

                        if matLen >= 15 then
                            matLen = matLen - 15

                            repeat
                                local nextToken = math.clamp(matLen, 0, 255)

                                write(string.pack('<I1', nextToken))

                                if nextToken == 255 then
                                    matLen = matLen - 255
                                end
                            until nextToken < 255
                        end
                    end
                end

                local compLen = string.len(output) - 4
                local decompLen = iostream.Length

                return string.pack('<I4', compLen) .. string.pack('<I4', decompLen) .. output
            end
            function lz4.decompress(lz4data)
                local inputStream = streamer(lz4data)
                local compressedLen = string.unpack('<I4', inputStream:read(4))
                local decompressedLen = string.unpack('<I4', inputStream:read(4))
                local reserved = string.unpack('<I4', inputStream:read(4))

                if compressedLen == 0 then
                    return inputStream:read(decompressedLen)
                end

                local outputStream = streamer('')

                repeat
                    local token = string.byte(inputStream:read())
                    local litLen = bit32.rshift(token, 4)
                    local matLen = bit32.band(token, 15) + 4

                    if litLen >= 15 then
                        repeat
                            local nextByte = string.byte(inputStream:read())

                            litLen = litLen + nextByte
                        until nextByte ~= 255
                    end

                    local literal = inputStream:read(litLen)

                    outputStream:append(literal)
                    outputStream:toEnd()

                    if outputStream.Length < decompressedLen then
                        local offset = string.unpack('<I2', inputStream:read(2))

                        if matLen >= 19 then
                            repeat
                                local nextByte = string.byte(inputStream:read())

                                matLen = matLen + nextByte
                            until nextByte ~= 255
                        end

                        outputStream:seek(-offset)

                        local pos = outputStream.Offset
                        local match = outputStream:read(matLen)
                        local unreadBytes = outputStream.LastUnreadBytes
                        local extra

                        if unreadBytes then
                            repeat
                                outputStream.Offset = pos
                                extra = outputStream:read(unreadBytes)
                                unreadBytes = outputStream.LastUnreadBytes
                                match = match .. extra
                            until unreadBytes <= 0
                        end

                        outputStream:append(match)
                        outputStream:toEnd()
                    end
                until outputStream.Length >= decompressedLen

                return outputStream.Source
            end

            return lz4
        end,
    },
    {
        name = 'DrawingLib',
        func = function()
            local coreGui = game:GetService('CoreGui')
            local camera = workspace.CurrentCamera
            local drawingUI = Instance.new('ScreenGui')

            drawingUI.Name = 'Drawing GUI'
            drawingUI.IgnoreGuiInset = true
            drawingUI.DisplayOrder = 0x7fffffff
            drawingUI.Parent = coreGui

            local drawingIndex = 0
            local drawingFontsEnum = {
                [0] = Font.fromEnum(Enum.Font.Roboto),
                [1] = Font.fromEnum(Enum.Font.Legacy),
                [2] = Font.fromEnum(Enum.Font.SourceSans),
                [3] = Font.fromEnum(Enum.Font.RobotoMono),
            }

            local function getFontFromIndex(fontIndex)
                return drawingFontsEnum[fontIndex]
            end
            local function convertTransparency(transparency)
                return math.clamp(1 - transparency, 0, 1)
            end

            local baseDrawingObj = setmetatable({
                Visible = true,
                ZIndex = 0,
                Transparency = 1,
                Color = Color3.new(),
                Remove = function(self)
                    setmetatable(self, nil)
                end,
                Destroy = function(self)
                    setmetatable(self, nil)
                end,
                SetProperty = function(self, index, value)
                    if self[index] ~= nil then
                        self[index] = value
                    else
                        warn('Attempted to set invalid property: ' .. tostring(index))
                    end
                end,
                GetProperty = function(self, index)
                    if self[index] ~= nil then
                        return self[index]
                    else
                        warn('Attempted to get invalid property: ' .. tostring(index))

                        return nil
                    end
                end,
                SetParent = function(self, parent)
                    self.Parent = parent
                end,
            }, {
                __add = function(t1, t2)
                    local result = {}

                    for index, value in pairs(t1)do
                        result[index] = value
                    end
                    for index, value in pairs(t2)do
                        result[index] = value
                    end

                    return result
                end,
            })
            local DrawingLib = {}

            DrawingLib.Fonts = {
                UI = 0,
                System = 1,
                Plex = 2,
                Monospace = 3,
            }

            function DrawingLib.new(drawingType)
                drawingIndex = drawingIndex + 1

                if drawingType == 'Line' then
                    return DrawingLib.createLine()
                elseif drawingType == 'Text' then
                    return DrawingLib.createText()
                elseif drawingType == 'Circle' then
                    return DrawingLib.createCircle()
                elseif drawingType == 'Square' then
                    return DrawingLib.createSquare()
                elseif drawingType == 'Image' then
                    return DrawingLib.createImage()
                elseif drawingType == 'Quad' then
                    return DrawingLib.createQuad()
                elseif drawingType == 'Triangle' then
                    return DrawingLib.createTriangle()
                elseif drawingType == 'Frame' then
                    return DrawingLib.createFrame()
                elseif drawingType == 'ScreenGui' then
                    return DrawingLib.createScreenGui()
                elseif drawingType == 'TextButton' then
                    return DrawingLib.createTextButton()
                elseif drawingType == 'TextLabel' then
                    return DrawingLib.createTextLabel()
                elseif drawingType == 'TextBox' then
                    return DrawingLib.createTextBox()
                else
                    error('Invalid drawing type: ' .. tostring(drawingType))
                end
            end
            function DrawingLib.createLine()
                local lineObj = ({
                    From = Vector2.zero,
                    To = Vector2.zero,
                    Thickness = 1,
                } + baseDrawingObj)
                local lineFrame = Instance.new('Frame')

                lineFrame.Name = drawingIndex
                lineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                lineFrame.BorderSizePixel = 0
                lineFrame.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if lineObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'From' or index == 'To' then
                            local direction = (index == 'From' and lineObj.To or value) - (index == 'From' and value or lineObj.From)
                            local center = (lineObj.To + lineObj.From) / 2
                            local distance = direction.Magnitude
                            local theta = math.deg(math.atan2(direction.Y, direction.X))

                            lineFrame.Position = UDim2.fromOffset(center.X, center.Y)
                            lineFrame.Rotation = theta
                            lineFrame.Size = UDim2.fromOffset(distance, lineObj.Thickness)
                        elseif index == 'Thickness' then
                            lineFrame.Size = UDim2.fromOffset((lineObj.To - lineObj.From).Magnitude, value)
                        elseif index == 'Visible' then
                            lineFrame.Visible = value
                        elseif index == 'ZIndex' then
                            lineFrame.ZIndex = value
                        elseif index == 'Transparency' then
                            lineFrame.BackgroundTransparency = convertTransparency(value)
                        elseif index == 'Color' then
                            lineFrame.BackgroundColor3 = value
                        elseif index == 'Parent' then
                            lineFrame.Parent = value
                        end

                        lineObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                lineFrame:Destroy()
                                lineObj:Remove()
                            end
                        end

                        return lineObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createText()
                local textObj = ({
                    Text = '',
                    Font = DrawingLib.Fonts.UI,
                    Size = 0,
                    Position = Vector2.zero,
                    Center = false,
                    Outline = false,
                    OutlineColor = Color3.new(),
                } + baseDrawingObj)
                local textLabel, uiStroke = Instance.new('TextLabel'), Instance.new('UIStroke')

                textLabel.Name = drawingIndex
                textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                textLabel.BorderSizePixel = 0
                textLabel.BackgroundTransparency = 1

                local function updateTextPosition()
                    local textBounds = textLabel.TextBounds
                    local offset = textBounds / 2

                    textLabel.Size = UDim2.fromOffset(textBounds.X, textBounds.Y)
                    textLabel.Position = UDim2.fromOffset(textObj.Position.X + (not textObj.Center and offset.X or 0), textObj.Position.Y + offset.Y)
                end

                textLabel:GetPropertyChangedSignal('TextBounds'):Connect(updateTextPosition)

                uiStroke.Thickness = 1
                uiStroke.Enabled = textObj.Outline
                uiStroke.Color = textObj.Color
                textLabel.Parent, uiStroke.Parent = drawingUI, textLabel

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if textObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Text' then
                            textLabel.Text = value
                        elseif index == 'Font' then
                            textLabel.FontFace = getFontFromIndex(math.clamp(value, 0, 3))
                        elseif index == 'Size' then
                            textLabel.TextSize = value
                        elseif index == 'Position' then
                            updateTextPosition()
                        elseif index == 'Center' then
                            textLabel.Position = UDim2.fromOffset((value and camera.ViewportSize / 2 or textObj.Position).X, textObj.Position.Y)
                        elseif index == 'Outline' then
                            uiStroke.Enabled = value
                        elseif index == 'OutlineColor' then
                            uiStroke.Color = value
                        elseif index == 'Visible' then
                            textLabel.Visible = value
                        elseif index == 'ZIndex' then
                            textLabel.ZIndex = value
                        elseif index == 'Transparency' then
                            local transparency = convertTransparency(value)

                            textLabel.TextTransparency = transparency
                            uiStroke.Transparency = transparency
                        elseif index == 'Color' then
                            textLabel.TextColor3 = value
                        elseif index == 'Parent' then
                            textLabel.Parent = value
                        end

                        textObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                textLabel:Destroy()
                                textObj:Remove()
                            end
                        elseif index == 'TextBounds' then
                            return textLabel.TextBounds
                        end

                        return textObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createCircle()
                local circleObj = ({
                    Radius = 150,
                    Position = Vector2.zero,
                    Thickness = 0.7,
                    Filled = false,
                } + baseDrawingObj)
                local circleFrame, uiCorner, uiStroke = Instance.new('Frame'), Instance.new('UICorner'), Instance.new('UIStroke')

                circleFrame.Name = drawingIndex
                circleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                circleFrame.BorderSizePixel = 0
                uiCorner.CornerRadius = UDim.new(1, 0)
                circleFrame.Size = UDim2.fromOffset(circleObj.Radius, circleObj.Radius)
                uiStroke.Thickness = circleObj.Thickness
                uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                circleFrame.Parent, uiCorner.Parent, uiStroke.Parent = drawingUI, circleFrame, circleFrame

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if circleObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Radius' then
                            local radius = value * 2

                            circleFrame.Size = UDim2.fromOffset(radius, radius)
                        elseif index == 'Position' then
                            circleFrame.Position = UDim2.fromOffset(value.X, value.Y)
                        elseif index == 'Thickness' then
                            uiStroke.Thickness = math.clamp(value, 0.6, 0x7fffffff)
                        elseif index == 'Filled' then
                            circleFrame.BackgroundTransparency = value and convertTransparency(circleObj.Transparency) or 1
                            uiStroke.Enabled = not value
                        elseif index == 'Visible' then
                            circleFrame.Visible = value
                        elseif index == 'ZIndex' then
                            circleFrame.ZIndex = value
                        elseif index == 'Transparency' then
                            local transparency = convertTransparency(value)

                            circleFrame.BackgroundTransparency = circleObj.Filled and transparency or 1
                            uiStroke.Transparency = transparency
                        elseif index == 'Color' then
                            circleFrame.BackgroundColor3 = value
                            uiStroke.Color = value
                        elseif index == 'Parent' then
                            circleFrame.Parent = value
                        end

                        circleObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                circleFrame:Destroy()
                                circleObj:Remove()
                            end
                        end

                        return circleObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createSquare()
                local squareObj = ({
                    Size = Vector2.zero,
                    Position = Vector2.zero,
                    Thickness = 0.7,
                    Filled = false,
                } + baseDrawingObj)
                local squareFrame, uiStroke = Instance.new('Frame'), Instance.new('UIStroke')

                squareFrame.Name = drawingIndex
                squareFrame.BorderSizePixel = 0
                squareFrame.Parent, uiStroke.Parent = drawingUI, squareFrame

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if squareObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Size' then
                            squareFrame.Size = UDim2.fromOffset(value.X, value.Y)
                        elseif index == 'Position' then
                            squareFrame.Position = UDim2.fromOffset(value.X, value.Y)
                        elseif index == 'Thickness' then
                            uiStroke.Thickness = math.clamp(value, 0.6, 0x7fffffff)
                        elseif index == 'Filled' then
                            squareFrame.BackgroundTransparency = value and convertTransparency(squareObj.Transparency) or 1
                            uiStroke.Enabled = not value
                        elseif index == 'Visible' then
                            squareFrame.Visible = value
                        elseif index == 'ZIndex' then
                            squareFrame.ZIndex = value
                        elseif index == 'Transparency' then
                            local transparency = convertTransparency(value)

                            squareFrame.BackgroundTransparency = squareObj.Filled and transparency or 1
                            uiStroke.Transparency = transparency
                        elseif index == 'Color' then
                            squareFrame.BackgroundColor3 = value
                            uiStroke.Color = value
                        elseif index == 'Parent' then
                            squareFrame.Parent = value
                        end

                        squareObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                squareFrame:Destroy()
                                squareObj:Remove()
                            end
                        end

                        return squareObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createImage()
                local imageObj = ({
                    Data = '',
                    DataURL = 'rbxassetid://0',
                    Size = Vector2.zero,
                    Position = Vector2.zero,
                } + baseDrawingObj)
                local imageFrame = Instance.new('ImageLabel')

                imageFrame.Name = drawingIndex
                imageFrame.BorderSizePixel = 0
                imageFrame.ScaleType = Enum.ScaleType.Stretch
                imageFrame.BackgroundTransparency = 1
                imageFrame.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if imageObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Data' then
                        elseif index == 'DataURL' then
                            imageFrame.Image = value
                        elseif index == 'Size' then
                            imageFrame.Size = UDim2.fromOffset(value.X, value.Y)
                        elseif index == 'Position' then
                            imageFrame.Position = UDim2.fromOffset(value.X, value.Y)
                        elseif index == 'Visible' then
                            imageFrame.Visible = value
                        elseif index == 'ZIndex' then
                            imageFrame.ZIndex = value
                        elseif index == 'Transparency' then
                            imageFrame.ImageTransparency = convertTransparency(value)
                        elseif index == 'Color' then
                            imageFrame.ImageColor3 = value
                        elseif index == 'Parent' then
                            imageFrame.Parent = value
                        end

                        imageObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                imageFrame:Destroy()
                                imageObj:Remove()
                            end
                        elseif index == 'Data' then
                            return nil
                        end

                        return imageObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createQuad()
                local quadObj = ({
                    PointA = Vector2.zero,
                    PointB = Vector2.zero,
                    PointC = Vector2.zero,
                    PointD = Vector2.zero,
                    Thickness = 1,
                    Filled = false,
                } + baseDrawingObj)
                local _linePoints = {
                    A = DrawingLib.createLine(),
                    B = DrawingLib.createLine(),
                    C = DrawingLib.createLine(),
                    D = DrawingLib.createLine(),
                }
                local fillFrame = Instance.new('Frame')

                fillFrame.Name = drawingIndex .. '_Fill'
                fillFrame.BorderSizePixel = 0
                fillFrame.BackgroundTransparency = quadObj.Transparency
                fillFrame.BackgroundColor3 = quadObj.Color
                fillFrame.ZIndex = quadObj.ZIndex
                fillFrame.Visible = quadObj.Visible and quadObj.Filled
                fillFrame.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if quadObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'PointA' then
                            _linePoints.A.From = value
                            _linePoints.B.To = value
                        elseif index == 'PointB' then
                            _linePoints.B.From = value
                            _linePoints.C.To = value
                        elseif index == 'PointC' then
                            _linePoints.C.From = value
                            _linePoints.D.To = value
                        elseif index == 'PointD' then
                            _linePoints.D.From = value
                            _linePoints.A.To = value
                        elseif index == 'Thickness' or index == 'Visible' or index == 'Color' or index == 'ZIndex' then
                            for _, linePoint in pairs(_linePoints)do
                                linePoint[index] = value
                            end

                            if index == 'Visible' then
                                fillFrame.Visible = value and quadObj.Filled
                            elseif index == 'Color' then
                                fillFrame.BackgroundColor3 = value
                            elseif index == 'ZIndex' then
                                fillFrame.ZIndex = value
                            end
                        elseif index == 'Filled' then
                            for _, linePoint in pairs(_linePoints)do
                                linePoint.Transparency = value and 1 or quadObj.Transparency
                            end

                            fillFrame.Visible = value
                        elseif index == 'Parent' then
                            fillFrame.Parent = value
                        end

                        quadObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                for _, linePoint in pairs(_linePoints)do
                                    linePoint:Remove()
                                end

                                fillFrame:Destroy()
                                quadObj:Remove()
                            end
                        end

                        return quadObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createTriangle()
                local triangleObj = ({
                    PointA = Vector2.zero,
                    PointB = Vector2.zero,
                    PointC = Vector2.zero,
                    Thickness = 1,
                    Filled = false,
                } + baseDrawingObj)
                local _linePoints = {
                    A = DrawingLib.createLine(),
                    B = DrawingLib.createLine(),
                    C = DrawingLib.createLine(),
                }
                local fillFrame = Instance.new('Frame')

                fillFrame.Name = drawingIndex .. '_Fill'
                fillFrame.BorderSizePixel = 0
                fillFrame.BackgroundTransparency = triangleObj.Transparency
                fillFrame.BackgroundColor3 = triangleObj.Color
                fillFrame.ZIndex = triangleObj.ZIndex
                fillFrame.Visible = triangleObj.Visible and triangleObj.Filled
                fillFrame.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if triangleObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'PointA' then
                            _linePoints.A.From = value
                            _linePoints.B.To = value
                        elseif index == 'PointB' then
                            _linePoints.B.From = value
                            _linePoints.C.To = value
                        elseif index == 'PointC' then
                            _linePoints.C.From = value
                            _linePoints.A.To = value
                        elseif index == 'Thickness' or index == 'Visible' or index == 'Color' or index == 'ZIndex' then
                            for _, linePoint in pairs(_linePoints)do
                                linePoint[index] = value
                            end

                            if index == 'Visible' then
                                fillFrame.Visible = value and triangleObj.Filled
                            elseif index == 'Color' then
                                fillFrame.BackgroundColor3 = value
                            elseif index == 'ZIndex' then
                                fillFrame.ZIndex = value
                            end
                        elseif index == 'Filled' then
                            for _, linePoint in pairs(_linePoints)do
                                linePoint.Transparency = value and 1 or triangleObj.Transparency
                            end

                            fillFrame.Visible = value
                        elseif index == 'Parent' then
                            fillFrame.Parent = value
                        end

                        triangleObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                for _, linePoint in pairs(_linePoints)do
                                    linePoint:Remove()
                                end

                                fillFrame:Destroy()
                                triangleObj:Remove()
                            end
                        end

                        return triangleObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createFrame()
                local frameObj = ({
                    Size = UDim2.new(0, 100, 0, 100),
                    Position = UDim2.new(0, 0, 0, 0),
                    Color = Color3.new(1, 1, 1),
                    Transparency = 0,
                    Visible = true,
                    ZIndex = 1,
                } + baseDrawingObj)
                local frame = Instance.new('Frame')

                frame.Name = drawingIndex
                frame.Size = frameObj.Size
                frame.Position = frameObj.Position
                frame.BackgroundColor3 = frameObj.Color
                frame.BackgroundTransparency = convertTransparency(frameObj.Transparency)
                frame.Visible = frameObj.Visible
                frame.ZIndex = frameObj.ZIndex
                frame.BorderSizePixel = 0
                frame.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if frameObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Size' then
                            frame.Size = value
                        elseif index == 'Position' then
                            frame.Position = value
                        elseif index == 'Color' then
                            frame.BackgroundColor3 = value
                        elseif index == 'Transparency' then
                            frame.BackgroundTransparency = convertTransparency(value)
                        elseif index == 'Visible' then
                            frame.Visible = value
                        elseif index == 'ZIndex' then
                            frame.ZIndex = value
                        elseif index == 'Parent' then
                            frame.Parent = value
                        end

                        frameObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                frame:Destroy()
                                frameObj:Remove()
                            end
                        end

                        return frameObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createScreenGui()
                local screenGuiObj = ({
                    IgnoreGuiInset = true,
                    DisplayOrder = 0,
                    ResetOnSpawn = true,
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                    Enabled = true,
                } + baseDrawingObj)
                local screenGui = Instance.new('ScreenGui')

                screenGui.Name = drawingIndex
                screenGui.IgnoreGuiInset = screenGuiObj.IgnoreGuiInset
                screenGui.DisplayOrder = screenGuiObj.DisplayOrder
                screenGui.ResetOnSpawn = screenGuiObj.ResetOnSpawn
                screenGui.ZIndexBehavior = screenGuiObj.ZIndexBehavior
                screenGui.Enabled = screenGuiObj.Enabled
                screenGui.Parent = coreGui

                return setmetatable({Parent = coreGui}, {
                    __newindex = function(_, index, value)
                        if screenGuiObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'IgnoreGuiInset' then
                            screenGui.IgnoreGuiInset = value
                        elseif index == 'DisplayOrder' then
                            screenGui.DisplayOrder = value
                        elseif index == 'ResetOnSpawn' then
                            screenGui.ResetOnSpawn = value
                        elseif index == 'ZIndexBehavior' then
                            screenGui.ZIndexBehavior = value
                        elseif index == 'Enabled' then
                            screenGui.Enabled = value
                        elseif index == 'Parent' then
                            screenGui.Parent = value
                        end

                        screenGuiObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                screenGui:Destroy()
                                screenGuiObj:Remove()
                            end
                        end

                        return screenGuiObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createTextButton()
                local buttonObj = ({
                    Text = 'Button',
                    Font = DrawingLib.Fonts.UI,
                    Size = 20,
                    Position = UDim2.new(0, 0, 0, 0),
                    Color = Color3.new(1, 1, 1),
                    BackgroundColor = Color3.new(0.2, 0.2, 0.2),
                    Transparency = 0,
                    Visible = true,
                    ZIndex = 1,
                    MouseButton1Click = nil,
                } + baseDrawingObj)
                local button = Instance.new('TextButton')

                button.Name = drawingIndex
                button.Text = buttonObj.Text
                button.FontFace = getFontFromIndex(buttonObj.Font)
                button.TextSize = buttonObj.Size
                button.Position = buttonObj.Position
                button.TextColor3 = buttonObj.Color
                button.BackgroundColor3 = buttonObj.BackgroundColor
                button.BackgroundTransparency = convertTransparency(buttonObj.Transparency)
                button.Visible = buttonObj.Visible
                button.ZIndex = buttonObj.ZIndex
                button.Parent = drawingUI

                local buttonEvents = {}

                return setmetatable({
                    Parent = drawingUI,
                    Connect = function(_, eventName, callback)
                        if eventName == 'MouseButton1Click' then
                            if buttonEvents.MouseButton1Click then
                                buttonEvents.MouseButton1Click:Disconnect()
                            end

                            buttonEvents.MouseButton1Click = button.MouseButton1Click:Connect(callback)
                        else
                            warn('Invalid event: ' .. tostring(eventName))
                        end
                    end,
                }, {
                    __newindex = function(_, index, value)
                        if buttonObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Text' then
                            button.Text = value
                        elseif index == 'Font' then
                            button.FontFace = getFontFromIndex(math.clamp(value, 0, 3))
                        elseif index == 'Size' then
                            button.TextSize = value
                        elseif index == 'Position' then
                            button.Position = value
                        elseif index == 'Color' then
                            button.TextColor3 = value
                        elseif index == 'BackgroundColor' then
                            button.BackgroundColor3 = value
                        elseif index == 'Transparency' then
                            button.BackgroundTransparency = convertTransparency(value)
                        elseif index == 'Visible' then
                            button.Visible = value
                        elseif index == 'ZIndex' then
                            button.ZIndex = value
                        elseif index == 'Parent' then
                            button.Parent = value
                        elseif index == 'MouseButton1Click' then
                            if typeof(value) == 'function' then
                                if buttonEvents.MouseButton1Click then
                                    buttonEvents.MouseButton1Click:Disconnect()
                                end

                                buttonEvents.MouseButton1Click = button.MouseButton1Click:Connect(value)
                            else
                                warn(
[[Invalid value for MouseButton1Click: expected function, got ]] .. typeof(value))
                            end
                        end

                        buttonObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                button:Destroy()
                                buttonObj:Remove()
                            end
                        end

                        return buttonObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createTextLabel()
                local labelObj = ({
                    Text = 'Label',
                    Font = DrawingLib.Fonts.UI,
                    Size = 20,
                    Position = UDim2.new(0, 0, 0, 0),
                    Color = Color3.new(1, 1, 1),
                    BackgroundColor = Color3.new(0.2, 0.2, 0.2),
                    Transparency = 0,
                    Visible = true,
                    ZIndex = 1,
                } + baseDrawingObj)
                local label = Instance.new('TextLabel')

                label.Name = drawingIndex
                label.Text = labelObj.Text
                label.FontFace = getFontFromIndex(labelObj.Font)
                label.TextSize = labelObj.Size
                label.Position = labelObj.Position
                label.TextColor3 = labelObj.Color
                label.BackgroundColor3 = labelObj.BackgroundColor
                label.BackgroundTransparency = convertTransparency(labelObj.Transparency)
                label.Visible = labelObj.Visible
                label.ZIndex = labelObj.ZIndex
                label.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if labelObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Text' then
                            label.Text = value
                        elseif index == 'Font' then
                            label.FontFace = getFontFromIndex(math.clamp(value, 0, 3))
                        elseif index == 'Size' then
                            label.TextSize = value
                        elseif index == 'Position' then
                            label.Position = value
                        elseif index == 'Color' then
                            label.TextColor3 = value
                        elseif index == 'BackgroundColor' then
                            label.BackgroundColor3 = value
                        elseif index == 'Transparency' then
                            label.BackgroundTransparency = convertTransparency(value)
                        elseif index == 'Visible' then
                            label.Visible = value
                        elseif index == 'ZIndex' then
                            label.ZIndex = value
                        elseif index == 'Parent' then
                            label.Parent = value
                        end

                        labelObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                label:Destroy()
                                labelObj:Remove()
                            end
                        end

                        return labelObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end
            function DrawingLib.createTextBox()
                local boxObj = ({
                    Text = '',
                    Font = DrawingLib.Fonts.UI,
                    Size = 20,
                    Position = UDim2.new(0, 0, 0, 0),
                    Color = Color3.new(1, 1, 1),
                    BackgroundColor = Color3.new(0.2, 0.2, 0.2),
                    Transparency = 0,
                    Visible = true,
                    ZIndex = 1,
                } + baseDrawingObj)
                local textBox = Instance.new('TextBox')

                textBox.Name = drawingIndex
                textBox.Text = boxObj.Text
                textBox.FontFace = getFontFromIndex(boxObj.Font)
                textBox.TextSize = boxObj.Size
                textBox.Position = boxObj.Position
                textBox.TextColor3 = boxObj.Color
                textBox.BackgroundColor3 = boxObj.BackgroundColor
                textBox.BackgroundTransparency = convertTransparency(boxObj.Transparency)
                textBox.Visible = boxObj.Visible
                textBox.ZIndex = boxObj.ZIndex
                textBox.Parent = drawingUI

                return setmetatable({Parent = drawingUI}, {
                    __newindex = function(_, index, value)
                        if boxObj[index] == nil then
                            warn('Invalid property: ' .. tostring(index))

                            return
                        end
                        if index == 'Text' then
                            textBox.Text = value
                        elseif index == 'Font' then
                            textBox.FontFace = getFontFromIndex(math.clamp(value, 0, 3))
                        elseif index == 'Size' then
                            textBox.TextSize = value
                        elseif index == 'Position' then
                            textBox.Position = value
                        elseif index == 'Color' then
                            textBox.TextColor3 = value
                        elseif index == 'BackgroundColor' then
                            textBox.BackgroundColor3 = value
                        elseif index == 'Transparency' then
                            textBox.BackgroundTransparency = convertTransparency(value)
                        elseif index == 'Visible' then
                            textBox.Visible = value
                        elseif index == 'ZIndex' then
                            textBox.ZIndex = value
                        elseif index == 'Parent' then
                            textBox.Parent = value
                        end

                        boxObj[index] = value
                    end,
                    __index = function(self, index)
                        if index == 'Remove' or index == 'Destroy' then
                            return function()
                                textBox:Destroy()
                                boxObj:Remove()
                            end
                        end

                        return boxObj[index]
                    end,
                    __tostring = function()
                        return 'Drawing'
                    end,
                })
            end

            local drawingFunctions = {}

            function drawingFunctions.isrenderobj(drawingObj)
                local success, isrenderobj = pcall(function()
                    return drawingObj.Parent == drawingUI
                end)

                if not success then
                    return false
                end

                return isrenderobj
            end
            function drawingFunctions.getrenderproperty(drawingObj, property)
                local success, drawingProperty = pcall(function()
                    return drawingObj[property]
                end)

                if not success then
                    return
                end
                if drawingProperty ~= nil then
                    return drawingProperty
                end
            end
            function drawingFunctions.setrenderproperty(
                drawingObj,
                property,
                value
            )
                assert(drawingFunctions.getrenderproperty(drawingObj, property), "'" .. tostring(property) .. "' is not a valid property of " .. tostring(drawingObj) .. ', ' .. tostring(typeof(drawingObj)))

                drawingObj[property] = value
            end
            function drawingFunctions.cleardrawcache()
                for _, drawing in drawingUI:GetDescendants()do
                    drawing:Remove()
                end
            end

            return {
                Drawing = DrawingLib,
                functions = drawingFunctions,
            }
        end,
    },
}
local lookupValueToCharacter = buffer.create(64)
local lookupCharacterToValue = buffer.create(256)
local alphabet = 
[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/]]
local padding = string.byte('=')

for index = 1, 64 do
    local value = index - 1
    local character = string.byte(alphabet, index)

    buffer.writeu8(lookupValueToCharacter, value, character)
    buffer.writeu8(lookupCharacterToValue, character, value)
end

local function raw_encode(input)
    local inputLength = buffer.len(input)
    local inputChunks = math.ceil(inputLength / 3)
    local outputLength = inputChunks * 4
    local output = buffer.create(outputLength)

    for chunkIndex = 1, inputChunks - 1 do
        local inputIndex = (chunkIndex - 1) * 3
        local outputIndex = (chunkIndex - 1) * 4
        local chunk = bit32.byteswap(buffer.readu32(input, inputIndex))
        local value1 = bit32.rshift(chunk, 26)
        local value2 = bit32.band(bit32.rshift(chunk, 20), 0x3f)
        local value3 = bit32.band(bit32.rshift(chunk, 14), 0x3f)
        local value4 = bit32.band(bit32.rshift(chunk, 8), 0x3f)

        buffer.writeu8(output, outputIndex, buffer.readu8(lookupValueToCharacter, value1))
        buffer.writeu8(output, outputIndex + 1, buffer.readu8(lookupValueToCharacter, value2))
        buffer.writeu8(output, outputIndex + 2, buffer.readu8(lookupValueToCharacter, value3))
        buffer.writeu8(output, outputIndex + 3, buffer.readu8(lookupValueToCharacter, value4))
    end

    local inputRemainder = inputLength % 3

    if inputRemainder == 1 then
        local chunk = buffer.readu8(input, inputLength - 1)
        local value1 = bit32.rshift(chunk, 2)
        local value2 = bit32.band(bit32.lshift(chunk, 4), 0x3f)

        buffer.writeu8(output, outputLength - 4, buffer.readu8(lookupValueToCharacter, value1))
        buffer.writeu8(output, outputLength - 3, buffer.readu8(lookupValueToCharacter, value2))
        buffer.writeu8(output, outputLength - 2, padding)
        buffer.writeu8(output, outputLength - 1, padding)
    elseif inputRemainder == 2 then
        local chunk = bit32.bor(bit32.lshift(buffer.readu8(input, inputLength - 2), 8), buffer.readu8(input, inputLength - 1))
        local value1 = bit32.rshift(chunk, 10)
        local value2 = bit32.band(bit32.rshift(chunk, 4), 0x3f)
        local value3 = bit32.band(bit32.lshift(chunk, 2), 0x3f)

        buffer.writeu8(output, outputLength - 4, buffer.readu8(lookupValueToCharacter, value1))
        buffer.writeu8(output, outputLength - 3, buffer.readu8(lookupValueToCharacter, value2))
        buffer.writeu8(output, outputLength - 2, buffer.readu8(lookupValueToCharacter, value3))
        buffer.writeu8(output, outputLength - 1, padding)
    elseif inputRemainder == 0 and inputLength ~= 0 then
        local chunk = bit32.bor(bit32.lshift(buffer.readu8(input, inputLength - 3), 16), bit32.lshift(buffer.readu8(input, inputLength - 2), 8), buffer.readu8(input, inputLength - 1))
        local value1 = bit32.rshift(chunk, 18)
        local value2 = bit32.band(bit32.rshift(chunk, 12), 0x3f)
        local value3 = bit32.band(bit32.rshift(chunk, 6), 0x3f)
        local value4 = bit32.band(chunk, 0x3f)

        buffer.writeu8(output, outputLength - 4, buffer.readu8(lookupValueToCharacter, value1))
        buffer.writeu8(output, outputLength - 3, buffer.readu8(lookupValueToCharacter, value2))
        buffer.writeu8(output, outputLength - 2, buffer.readu8(lookupValueToCharacter, value3))
        buffer.writeu8(output, outputLength - 1, buffer.readu8(lookupValueToCharacter, value4))
    end

    return output
end
local function raw_decode(input)
    local inputLength = buffer.len(input)
    local inputChunks = math.ceil(inputLength / 4)
    local inputPadding = 0

    if inputLength ~= 0 then
        if buffer.readu8(input, inputLength - 1) == padding then
            inputPadding = inputPadding + 1
        end
        if buffer.readu8(input, inputLength - 2) == padding then
            inputPadding = inputPadding + 1
        end
    end

    local outputLength = inputChunks * 3 - inputPadding
    local output = buffer.create(outputLength)

    for chunkIndex = 1, inputChunks - 1 do
        local inputIndex = (chunkIndex - 1) * 4
        local outputIndex = (chunkIndex - 1) * 3
        local value1 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, inputIndex))
        local value2 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, inputIndex + 1))
        local value3 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, inputIndex + 2))
        local value4 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, inputIndex + 3))
        local chunk = bit32.bor(bit32.lshift(value1, 18), bit32.lshift(value2, 12), bit32.lshift(value3, 6), value4)
        local character1 = bit32.rshift(chunk, 16)
        local character2 = bit32.band(bit32.rshift(chunk, 8), 0xff)
        local character3 = bit32.band(chunk, 0xff)

        buffer.writeu8(output, outputIndex, character1)
        buffer.writeu8(output, outputIndex + 1, character2)
        buffer.writeu8(output, outputIndex + 2, character3)
    end

    if inputLength ~= 0 then
        local lastInputIndex = (inputChunks - 1) * 4
        local lastOutputIndex = (inputChunks - 1) * 3
        local lastValue1 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, lastInputIndex))
        local lastValue2 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, lastInputIndex + 1))
        local lastValue3 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, lastInputIndex + 2))
        local lastValue4 = buffer.readu8(lookupCharacterToValue, buffer.readu8(input, lastInputIndex + 3))
        local lastChunk = bit32.bor(bit32.lshift(lastValue1, 18), bit32.lshift(lastValue2, 12), bit32.lshift(lastValue3, 6), lastValue4)

        if inputPadding <= 2 then
            local lastCharacter1 = bit32.rshift(lastChunk, 16)

            buffer.writeu8(output, lastOutputIndex, lastCharacter1)

            if inputPadding <= 1 then
                local lastCharacter2 = bit32.band(bit32.rshift(lastChunk, 8), 0xff)

                buffer.writeu8(output, lastOutputIndex + 1, lastCharacter2)

                if inputPadding == 0 then
                    local lastCharacter3 = bit32.band(lastChunk, 0xff)

                    buffer.writeu8(output, lastOutputIndex + 2, lastCharacter3)
                end
            end
        end
    end

    return output
end

local base64 = {
    encode = function(input)
        return buffer.tostring(raw_encode(buffer.fromstring(input)))
    end,
    decode = function(encoded)
        return buffer.tostring(raw_decode(buffer.fromstring(encoded)))
    end,
}
local _require, _game, _workspace = require, game, workspace

function Init.GetObjects(asset)
    return {
        InsertService:LoadLocalAsset(asset),
    }
end

local proxiedServices = {
    LinkingService = {
        {
            'OpenUrl',
        },
        game:GetService('LinkingService'),
    },
    ScriptContext = {
        {
            'SaveScriptProfilingData',
            'AddCoreScriptLocal',
            'ScriptProfilerService',
        },
        game:GetService('ScriptContext'),
    },
    MessageBusService = {
        {
            'Call',
            'GetLast',
            'GetMessageId',
            'GetProtocolMethodRequestMessageId',
            'GetProtocolMethodResponseMessageId',
            'MakeRequest',
            'Publish',
            'PublishProtocolMethodRequest',
            'PublishProtocolMethodResponse',
            'Subscribe',
            'SubscribeToProtocolMethodRequest',
            'SubscribeToProtocolMethodResponse',
        },
        game:GetService('MessageBusService'),
    },
    GuiService = {
        {
            'OpenBrowserWindow',
            'OpenNativeOverlay',
        },
        game:GetService('GuiService'),
    },
    MarketplaceService = {
        {
            'GetRobuxBalance',
            'PerformPurchase',
            'PerformPurchaseV2',
        },
        game:GetService('MarketplaceService'),
    },
    HttpRbxApiService = {
        {
            'GetAsyncFullUrl',
            'PostAsyncFullUrl',
            'GetAsync',
            'PostAsync',
            'RequestAsync',
        },
        game:GetService('HttpRbxApiService'),
    },
    Players = {
        {
            'ReportAbuse',
            'ReportAbuseV3',
        },
        game:GetService('Players'),
    },
    HttpService = {
        {
            'RequestInternal',
        },
        game:GetService('HttpService'),
    },
    BrowserService = {
        {
            'ExecuteJavaScript',
            'OpenBrowserWindow',
            'ReturnToJavaScript',
            'OpenUrl',
            'SendCommand',
            'OpenNativeOverlay',
        },
        game:GetService('BrowserService'),
    },
    CaptureService = {
        {
            'DeleteCapture',
        },
        game:GetService('CaptureService'),
    },
    OmniRecommendationsService = {
        {
            'MakeRequest',
        },
        game:GetService('OmniRecommendationsService'),
    },
    OpenCloudService = {
        {
            'HttpRequestAsync',
        },
        game:GetService('OpenCloudService'),
    },
}

local function find(t, x)
    x = string.gsub(tostring(x), '\0', '')

    for i, v in t do
        if v:lower() == x:lower() then
            return true
        end
    end
end
local function setupBlockedServiceFuncs(serviceTable)
    serviceTable.proxy = newproxy(true)

    local proxyMt = getmetatable(serviceTable.proxy)

    proxyMt.__index = function(self, index)
        index = string.gsub(tostring(index), '\0', '')

        if find(serviceTable[1], index) then
            return function(self, ...)
                error('Attempt to call a blocked function: ' .. index, 2)
            end
        end
        if index == 'Parent' then
            return Init.game
        end
        if type(serviceTable[2][index]) == 'function' then
            return function(self, ...)
                return serviceTable[2][index](serviceTable[2], ...)
            end
        else
            return serviceTable[2][index]
        end
    end
    proxyMt.__newindex = function(self, index, value)
        serviceTable[2][index] = value
    end
    proxyMt.__tostring = function(self)
        return serviceTable[2].Name
    end
    proxyMt.__metatable = getmetatable(serviceTable[2])
end

for i, serviceTable in proxiedServices do
    setupBlockedServiceFuncs(serviceTable)
end

Init.game = newproxy(true)

local gameProxy = getmetatable(Init.game)

gameProxy.__index = function(self, index)
    if index == 'GetObjects' then
        return function(self, ...)
            return Init.GetObjects(...)
        end
    end
    if type(_game[index]) == 'function' then
        return function(self, ...)
            if index == 'GetService' or index == 'FindService' then
                local args = {...}

                if proxiedServices[string.gsub(tostring(args[1]), '\0', '')] then
                    return proxiedServices[string.gsub(args[1], '\0', '')].proxy
                end
            end
            if find({
                'Load',
                'OpenScreenshotsFolder',
                'OpenVideosFolder',
            }, index) then
                error('Attempt to call a blocked function: ' .. tostring(index), 2)
            end

            return _game[index](_game, ...)
        end
    else
        if proxiedServices[index] then
            return proxiedServices[index].proxy
        end

        return _game[index]
    end
end
gameProxy.__newindex = function(self, index, value)
    _game[index] = value
end
gameProxy.__tostring = function(self)
    return _game.Name
end
gameProxy.__metatable = getmetatable(_game)
Init.Game = Init.game
Init.workspace = newproxy(true)

local workspaceProxy = getmetatable(Init.workspace)

workspaceProxy.__index = function(self, index)
    index = string.gsub(tostring(index), '\0', '')

    if index == 'Parent' then
        return Init.game
    end
    if type(_workspace[index]) == 'function' then
        return function(self, ...)
            return _workspace[index](_workspace, ...)
        end
    else
        return _workspace[index]
    end
end
workspaceProxy.__newindex = function(self, index, value)
    _workspace[index] = value
end
workspaceProxy.__tostring = function(self)
    return _workspace.Name
end
workspaceProxy.__metatable = getmetatable(_workspace)
Init.Workspace = Init.workspace

function Init.getgenv()
    return Init
end

do
    local libsLoaded = 0

    for i, libInfo in pairs(libs)do
        task.spawn(function()
            libs[i].content = libInfo.func()
            libsLoaded = libsLoaded + 1
        end)
    end

    while libsLoaded < #libs do
        task.wait()
    end
end

local function getlib(libName)
    for i, lib in pairs(libs)do
        if lib.name == libName then
            return lib.content
        end
    end

    return nil
end

local HashLib, lz4, DrawingLib = getlib('HashLib'), getlib('lz4'), getlib('DrawingLib')

Init.base64 = base64
Init.base64_encode = base64.encode
Init.base64encode = base64.encode
Init.base64_decode = base64.decode
Init.base64decode = base64.decode
Init.crypt = {
    base64 = base64,
    base64encode = base64.encode,
    base64_encode = base64.encode,
    base64decode = base64.decode,
    base64_decode = base64.decode,
    hex = {
        encode = function(txt)
            txt = tostring(txt)

            local hex = ''

            for i = 1, #txt do
                hex = hex .. string.format('%02x', string.byte(txt, i))
            end

            return hex
        end,
        decode = function(hex)
            hex = tostring(hex)

            local text = ''

            for i = 1, #hex, 2 do
                local byte_str = string.sub(hex, i, i + 1)
                local byte = tonumber(byte_str, 16)

                text = text .. string.char(byte)
            end

            return text
        end,
    },
    url = {
        encode = function(x)
            return HttpService:UrlEncode(x)
        end,
        decode = function(x)
            x = tostring(x)
            x = string.gsub(x, '+', ' ')
            x = string.gsub(x, '%%(%x%x)', function(hex)
                return string.char(tonumber(hex, 16))
            end)
            x = string.gsub(x, '\r\n', '\n')

            return x
        end,
    },
    generatekey = function(len)
        local key = ''
        local x = 
[[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/]]

        for i = 1, len or 32 do
            local n = math.random(1, #x)

            key = key .. x:sub(n, n)
        end

        return base64.encode(key)
    end,
    encrypt = function(a, b)
        local result = {}

        a = tostring(a)
        b = tostring(b)

        for i = 1, #a do
            local byte = string.byte(a, i)
            local keyByte = string.byte(b, (i - 1) % #b + 1)

            table.insert(result, string.char(bit32.bxor(byte, keyByte)))
        end

        return table.concat(result), b
    end,
}
Init.crypt.generatebytes = function(len)
    return Init.crypt.generatekey(len)
end
Init.crypt.random = function(len)
    return Init.crypt.generatekey(len)
end
Init.crypt.decrypt = Init.crypt.encrypt

function Init.crypt.hash(txt, hashName)
    for name, func in pairs(HashLib)do
        if name == hashName or name:gsub('_', '-') == hashName then
            return func(txt)
        end
    end
end

Init.hash = Init.crypt.hash
Init.crypt.lz4 = lz4
Init.crypt.lz4compress = lz4.compress
Init.crypt.lz4decompress = lz4.decompress
Init.lz4 = lz4
Init.lz4compress = lz4.compress
Init.lz4decompress = lz4.decompress

local Drawing, drawingFunctions = DrawingLib.Drawing, DrawingLib.functions

Init.Drawing = Drawing

for name, func in drawingFunctions do
    Init[name] = func
end

function Init.clonefunction(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'clonefunction' (function expected, got ]] .. type(func) .. ') ', 2)

    local a = func
    local b = xpcall(setfenv, function(x, y)
        return x, y
    end, func, getfenv(func))

    if b then
        return function(...)
            return a(...)
        end
    end

    return coroutine.wrap(function(...)
        while true do
            a = coroutine.yield(a(...))
        end
    end)
end
function Init.islclosure(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'islclosure' (function expected, got ]] .. type(func) .. ') ', 2)

    return debug.info(func, 's') ~= '[C]'
end
function Init.iscclosure(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'iscclosure' (function expected, got ]] .. type(func) .. ') ', 2)

    return not Init.islclosure(func)
end
function Init.newlclosure(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'newlclosure' (function expected, got ]] .. type(func) .. ') ', 2)

    return function(...)
        return func(...)
    end
end
function Init.newcclosure(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'newcclosure' (function expected, got ]] .. type(func) .. ') ', 2)

    return coroutine.wrap(function(...)
        while true do
            coroutine.yield(func(...))
        end
    end)
end
function Init.fireclickdetector(part)
    assert(typeof(part) == 'Instance', 
[[invalid argument #1 to 'fireclickdetector' (Instance expected, got ]] .. type(part) .. ') ', 2)

    local clickDetector = part:FindFirstChild('ClickDetector') or part
    local previousParent = clickDetector.Parent
    local newPart = Instance.new('Part', _workspace)

    do
        newPart.Transparency = 1
        newPart.Size = Vector3.new(30, 30, 30)
        newPart.Anchored = true
        newPart.CanCollide = false

        task.delay(15, function()
            if newPart:IsDescendantOf(game) then
                newPart:Destroy()
            end
        end)

        clickDetector.Parent = newPart
        clickDetector.MaxActivationDistance = math.huge
    end

    local vUser = game:FindService('VirtualUser') or game:GetService('VirtualUser')
    local connection = RunService.Heartbeat:Connect(function()
        local camera = _workspace.CurrentCamera or _workspace.Camera

        newPart.CFrame = camera.CFrame * CFrame.new(0, 0, -20) * CFrame.new(camera.CFrame.LookVector.X, camera.CFrame.LookVector.Y, camera.CFrame.LookVector.Z)

        vUser:ClickButton1(Vector2.new(20, 20), camera.CFrame)
    end)

    clickDetector.MouseClick:Once(function()
        connection:Disconnect()

        clickDetector.Parent = previousParent

        newPart:Destroy()
    end)
end
function Init.fireproximityprompt(proximityprompt, amount, skip)
    assert(typeof(proximityprompt) == 'Instance', 
[[invalid argument #1 to 'fireproximityprompt' (Instance expected, got ]] .. typeof(proximityprompt) .. ') ', 2)
    assert(proximityprompt:IsA('ProximityPrompt'), 
[[invalid argument #1 to 'fireproximityprompt' (ProximityPrompt expected, got ]] .. proximityprompt.ClassName .. ') ', 2)

    amount = amount or 1
    skip = skip or false

    assert(type(amount) == 'number', 
[[invalid argument #2 to 'fireproximityprompt' (number expected, got ]] .. type(amount) .. ') ', 2)
    assert(type(skip) == 'boolean', 
[[invalid argument #2 to 'fireproximityprompt' (boolean expected, got ]] .. type(amount) .. ') ', 2)

    local oldHoldDuration = proximityprompt.HoldDuration
    local oldMaxDistance = proximityprompt.MaxActivationDistance

    proximityprompt.MaxActivationDistance = 9e9

    proximityprompt:InputHoldBegin()

    for i = 1, amount or 1 do
        if skip then
            proximityprompt.HoldDuration = 0
        else
            task.wait(proximityprompt.HoldDuration + 0.01)
        end
    end

    proximityprompt:InputHoldEnd()

    proximityprompt.MaxActivationDistance = oldMaxDistance
    proximityprompt.HoldDuration = oldHoldDuration
end
function Init.setsimulationradius(newRadius, newMaxRadius)
    newRadius = tonumber(newRadius)
    newMaxRadius = tonumber(newMaxRadius) or newRadius

    assert(type(newRadius) == 'number', 
[[invalid argument #1 to 'setsimulationradius' (number expected, got ]] .. type(newRadius) .. ') ', 2)

    local lp = game:FindService('Players').LocalPlayer

    if lp then
        lp.SimulationRadius = newRadius
        lp.MaximumSimulationRadius = newMaxRadius or newRadius
    end
end
function Init.isreadonly(t)
    assert(type(t) == 'table', "invalid argument #1 to 'isreadonly' (table expected, got " .. type(t) .. ') ', 2)

    return table.isfrozen(t)
end

local renv = {
    print = print,
    warn = warn,
    error = error,
    assert = assert,
    collectgarbage = collectgarbage,
    require = require,
    select = select,
    tonumber = tonumber,
    tostring = tostring,
    type = type,
    xpcall = xpcall,
    pairs = pairs,
    next = next,
    ipairs = ipairs,
    newproxy = newproxy,
    rawequal = rawequal,
    rawget = rawget,
    rawset = rawset,
    rawlen = rawlen,
    gcinfo = gcinfo,
    coroutine = {
        create = coroutine.create,
        resume = coroutine.resume,
        running = coroutine.running,
        status = coroutine.status,
        wrap = coroutine.wrap,
        yield = coroutine.yield,
    },
    bit32 = {
        arshift = bit32.arshift,
        band = bit32.band,
        bnot = bit32.bnot,
        bor = bit32.bor,
        btest = bit32.btest,
        extract = bit32.extract,
        lshift = bit32.lshift,
        replace = bit32.replace,
        rshift = bit32.rshift,
        bxor = bit32.bxor
    },
    math = {
        abs = math.abs,
        acos = math.acos,
        asin = math.asin,
        atan = math.atan,
        atan2 = math.atan2,
        ceil = math.ceil,
        cos = math.cos,
        cosh = math.cosh,
        deg = math.deg,
        exp = math.exp,
        floor = math.floor,
        fmod = math.fmod,
        frexp = math.frexp,
        ldexp = math.ldexp,
        log = math.log,
        log10 = math.log10,
        max = math.max,
        min = math.min,
        modf = math.modf,
        pow = math.pow,
        rad = math.rad,
        random = math.random,
        randomseed = math.randomseed,
        sin = math.sin,
        sinh = math.sinh,
        sqrt = math.sqrt,
        tan = math.tan,
        tanh = math.tanh,
    },
    string = {
        byte = string.byte,
        char = string.char,
        find = string.find,
        format = string.format,
        gmatch = string.gmatch,
        gsub = string.gsub,
        len = string.len,
        lower = string.lower,
        match = string.match,
        pack = string.pack,
        packsize = string.packsize,
        rep = string.rep,
        reverse = string.reverse,
        sub = string.sub,
        unpack = string.unpack,
        upper = string.upper,
    },
    table = {
        concat = table.concat,
        insert = table.insert,
        pack = table.pack,
        remove = table.remove,
        sort = table.sort,
        unpack = table.unpack,
    },
    utf8 = {
        char = utf8.char,
        charpattern = utf8.charpattern,
        codepoint = utf8.codepoint,
        codes = utf8.codes,
        len = utf8.len,
        nfdnormalize = utf8.nfdnormalize,
        nfcnormalize = utf8.nfcnormalize,
    },
    os = {
        clock = os.clock,
        date = os.date,
        difftime = os.difftime,
        time = os.time,
    },
    delay = delay,
    elapsedTime = elapsedTime,
    spawn = spawn,
    tick = tick,
    time = time,
    typeof = typeof,
    UserSettings = UserSettings,
    version = version,
    wait = wait,
    _VERSION = _VERSION,
    task = {
        defer = task.defer,
        delay = task.delay,
        spawn = task.spawn,
        wait = task.wait,
    },
    debug = {
        traceback = debug.traceback,
        profilebegin = debug.profilebegin,
        profileend = debug.profileend,
    },
    game = Init.game,
    workspace = Init.workspace,
    Game = Init.game,
    Workspace = Init.workspace,
    getmetatable = getmetatable,
    setmetatable = setmetatable,
}

function Init.getrenv()
    return renv
end
function Init.isexecutorclosure(func)
    assert(type(func) == 'function', 
[[invalid argument #1 to 'isexecutorclosure' (function expected, got ]] .. type(func) .. ') ', 2)

    for _, genv in Init.getgenv()do
        if genv == func then
            return true
        end
    end

    local function check(t)
        local isglobal = false

        for i, v in t do
            if type(v) == 'table' then
                check(v)
            end
            if v == func then
                isglobal = true
            end
        end

        return isglobal
    end

    if check(Init.getgenv().getrenv()) then
        return false
    end

    return true
end

Init.checkclosure = Init.isexecutorclosure
Init.isourclosure = Init.isexecutorclosure

local windowActive = true

UserInputService.WindowFocused:Connect(function()
    windowActive = true
end)
UserInputService.WindowFocusReleased:Connect(function()
    windowActive = false
end)

function Init.isrbxactive()
    return windowActive
end

Init.isgameactive = Init.isrbxactive
Init.iswindowactive = Init.isrbxactive

function Init.getinstances()
    return _game:GetDescendants()
end

local nilinstances, cache = {
    Instance.new('Part'),
}, {cached = {}}

function Init.getnilinstances()
    return nilinstances
end
function cache.iscached(t)
    return cache.cached[t] ~= 'r' or (not t:IsDescendantOf(game))
end
function cache.invalidate(t)
    cache.cached[t] = 'r'
    t.Parent = nil
end
function cache.replace(x, y)
    if cache.cached[x] then
        cache.cached[x] = y
    end

    y.Parent = x.Parent
    y.Name = x.Name
    x.Parent = nil
end

Init.cache = cache

function Init.getgc()
    return table.clone(nilinstances)
end

_game.DescendantRemoving:Connect(function(des)
    table.insert(nilinstances, des)
    task.delay(60, function()
        local index = table.find(nilinstances, des)

        if index then
            table.remove(nilinstances, index)
        end
        if cache.cached[des] then
            cache.cached[des] = nil
        end
    end)

    cache.cached[des] = 'r'
end)
_game.DescendantAdded:Connect(function(des)
    cache.cached[des] = true
end)

function Init.getrunningscripts()
    local scripts = {}

    for _, v in pairs(Init.getinstances())do
        if v:IsA('LocalScript') and v.Enabled then
            table.insert(scripts, v)
        end
    end

    return scripts
end

Init.getscripts = Init.getrunningscripts

function Init.getloadedmodules()
    local modules = {}

    for _, v in pairs(Init.getinstances())do
        if v:IsA('ModuleScript') then
            table.insert(modules, v)
        end
    end

    return modules
end
function Init.checkcaller()
    local info = debug.info(Init.getgenv, 'slnaf')

    return debug.info(1, 'slnaf') == info
end
function Init.getthreadcontext()
    return 3
end

Init.getthreadidentity = Init.getthreadcontext
Init.getidentity = Init.getthreadcontext

function Init.setthreadidentity()
    return 3, 'Not Implemented'
end

Init.setidentity = Init.setthreadidentity
Init.setthreadcontext = Init.setthreadidentity

function Init.getsenv(script_instance)
    local env = getfenv(debug.info(2, 'f'))

    return setmetatable({script = script_instance}, {
        __index = function(self, index)
            return env[index] or rawget(self, index)
        end,
        __newindex = function(self, index, value)
            xpcall(function()
                env[index] = value
            end, function()
                rawset(self, index, value)
            end)
        end,
    })
end
function Init.getscripthash(instance)
    assert(typeof(instance) == 'Instance', 
[[invalid argument #1 to 'getscripthash' (Instance expected, got ]] .. typeof(instance) .. ') ', 2)
    assert(instance:IsA('LuaSourceContainer'), 
[[invalid argument #1 to 'getscripthash' (LuaSourceContainer expected, got ]] .. instance.ClassName .. ') ', 2)

    return instance:GetHash()
end
function Init.cloneref(reference)
    if _game:FindFirstChild(reference.Name) or reference.Parent == _game then
        return reference
    else
        local class = reference.ClassName
        local cloned = Instance.new(class)
        local mt = {
            __index = reference,
            __newindex = function(t, k, v)
                if k == 'Name' then
                    reference.Name = v
                end

                rawset(t, k, v)
            end,
        }
        local proxy = setmetatable({}, mt)

        return proxy
    end
end
function Init.compareinstances(x, y)
    if type(getmetatable(y)) == 'table' then
        return x.ClassName == y.ClassName
    end

    return false
end
function Init.gethui()
    return Init.cloneref(_game:FindService('CoreGui'))
end
function Init.isnetworkowner(part)
    assert(typeof(part) == 'Instance', 
[[invalid argument #1 to 'isnetworkowner' (Instance expected, got ]] .. type(part) .. ') ')

    if part.Anchored then
        return false
    end

    return part.ReceiveAge == 0
end
function Init.deepclone(object)
    local lookup = {}

    local function copy(obj)
        if type(obj) ~= 'table' then
            return obj
        end
        if lookup[obj] then
            return lookup[obj]
        end

        local new = {}

        lookup[obj] = new

        for k, v in pairs(obj)do
            new[copy(k)] = copy(v)
        end

        return setmetatable(new, getmetatable(obj))
    end

    return copy(object)
end

Init.debug = table.clone(debug)

function Init.debug.getinfo(f, options)
    if type(options) == 'string' then
        options = string.lower(options)
    else
        options = 'sflnu'
    end

    local result = {}

    for index = 1, #options do
        local option = string.sub(options, index, index)

        if 's' == option then
            local short_src = debug.info(f, 's')

            result.short_src = short_src
            result.source = '=' .. short_src
            result.what = short_src == '[C]' and 'C' or 'Lua'
        elseif 'f' == option then
            result.func = debug.info(f, 'f')
        elseif 'l' == option then
            result.currentline = debug.info(f, 'l')
        elseif 'n' == option then
            result.name = debug.info(f, 'n')
        elseif 'u' == option or option == 'a' then
            local numparams, is_vararg = debug.info(f, 'a')

            result.numparams = numparams
            result.is_vararg = is_vararg and 1 or 0

            if 'u' == option then
                result.nups = -1
            end
        end
    end

    return result
end

local fpscap = math.huge

function Init.setfpscap(cap)
    cap = tonumber(cap)

    assert(type(cap) == 'number', "invalid argument #1 to 'setfpscap' (number expected, got " .. type(cap) .. ')', 2)

    if cap < 1 then
        cap = math.huge
    end

    fpscap = cap
end

local clock = tick()

RunService.RenderStepped:Connect(function()
    while clock + 1 / fpscap > tick() do end

    clock = tick()

    task.wait()
end)

function Init.getfpscap()
    return fpscap
end
function Init.mouse1click(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, _game, false)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, _game, false)
end
function Init.mouse1press(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, _game, false)
end
function Init.mouse1release(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, _game, false)
end
function Init.mouse2click(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 1, true, _game, false)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(x, y, 1, false, _game, false)
end
function Init.mouse2press(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 1, true, _game, false)
end
function Init.mouse2release(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseButtonEvent(x, y, 1, false, _game, false)
end
function Init.mousescroll(x, y, z)
    VirtualInputManager:SendMouseWheelEvent(x or 0, y or 0, z or false, _game)
end
function Init.mousemoverel(x, y)
    x = x or 0
    y = y or 0

    local vpSize = _workspace.CurrentCamera.ViewportSize
    local x = vpSize.X * x
    local y = vpSize.Y * y

    VirtualInputManager:SendMouseMoveEvent(x, y, _game)
end
function Init.mousemoveabs(x, y)
    x = x or 0
    y = y or 0

    VirtualInputManager:SendMouseMoveEvent(x, y, _game)
end
function Init.getscriptclosure(s)
    return function()
        return table.clone(Init.require(s))
    end
end

Init.getscriptfunction = Init.getscriptclosure

function Init.isscriptable(object, property)
    if object and typeof(object) == 'Instance' then
        local success, result = pcall(function()
            return object[property] ~= nil
        end)

        return success and result
    end

    return false
end
setfenv(0, Init)
