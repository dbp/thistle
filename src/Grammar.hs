{-# OPTIONS_GHC -w #-}
module Grammar (parse) where

import Data.Monoid
import qualified Data.Map as M

import Lexer
import Lang
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

action_0 (12) = happyShift action_2
action_0 (13) = happyShift action_5
action_0 (14) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (18) = happyShift action_9
action_0 (20) = happyShift action_10
action_0 (26) = happyShift action_11
action_0 (27) = happyShift action_12
action_0 (34) = happyShift action_13
action_0 (36) = happyShift action_14
action_0 (38) = happyShift action_15
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail

action_1 (12) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (21) = happyShift action_30
action_3 (22) = happyShift action_31
action_3 (23) = happyShift action_32
action_3 (24) = happyShift action_33
action_3 (30) = happyShift action_34
action_3 (34) = happyShift action_35
action_3 (43) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_18

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 _ = happyReduce_4

action_8 (12) = happyShift action_2
action_8 (13) = happyShift action_5
action_8 (14) = happyShift action_6
action_8 (15) = happyShift action_7
action_8 (16) = happyShift action_8
action_8 (18) = happyShift action_9
action_8 (20) = happyShift action_10
action_8 (26) = happyShift action_11
action_8 (27) = happyShift action_12
action_8 (34) = happyShift action_13
action_8 (36) = happyShift action_14
action_8 (38) = happyShift action_15
action_8 (4) = happyGoto action_29
action_8 (5) = happyGoto action_4
action_8 _ = happyFail

action_9 (12) = happyShift action_2
action_9 (13) = happyShift action_5
action_9 (14) = happyShift action_6
action_9 (15) = happyShift action_7
action_9 (16) = happyShift action_8
action_9 (18) = happyShift action_9
action_9 (20) = happyShift action_10
action_9 (26) = happyShift action_11
action_9 (27) = happyShift action_12
action_9 (34) = happyShift action_13
action_9 (36) = happyShift action_14
action_9 (38) = happyShift action_15
action_9 (4) = happyGoto action_28
action_9 (5) = happyGoto action_4
action_9 _ = happyFail

action_10 (40) = happyShift action_27
action_10 _ = happyFail

action_11 (25) = happyShift action_26
action_11 _ = happyReduce_5

action_12 _ = happyReduce_6

action_13 (12) = happyShift action_2
action_13 (13) = happyShift action_5
action_13 (14) = happyShift action_6
action_13 (15) = happyShift action_7
action_13 (16) = happyShift action_8
action_13 (18) = happyShift action_9
action_13 (20) = happyShift action_10
action_13 (26) = happyShift action_24
action_13 (27) = happyShift action_12
action_13 (34) = happyShift action_13
action_13 (35) = happyShift action_25
action_13 (36) = happyShift action_14
action_13 (38) = happyShift action_15
action_13 (4) = happyGoto action_22
action_13 (5) = happyGoto action_4
action_13 (7) = happyGoto action_23
action_13 _ = happyFail

action_14 (12) = happyShift action_2
action_14 (13) = happyShift action_5
action_14 (14) = happyShift action_6
action_14 (15) = happyShift action_7
action_14 (16) = happyShift action_8
action_14 (18) = happyShift action_9
action_14 (20) = happyShift action_10
action_14 (26) = happyShift action_11
action_14 (27) = happyShift action_12
action_14 (32) = happyShift action_21
action_14 (34) = happyShift action_13
action_14 (36) = happyShift action_14
action_14 (38) = happyShift action_15
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 (6) = happyGoto action_20
action_14 _ = happyFail

action_15 (26) = happyShift action_17
action_15 (39) = happyShift action_18
action_15 (9) = happyGoto action_16
action_15 _ = happyFail

action_16 (39) = happyShift action_61
action_16 _ = happyFail

action_17 (32) = happyShift action_60
action_17 _ = happyFail

action_18 _ = happyReduce_13

action_19 (21) = happyShift action_30
action_19 (22) = happyShift action_31
action_19 (23) = happyShift action_32
action_19 (24) = happyShift action_33
action_19 (30) = happyShift action_34
action_19 (31) = happyShift action_59
action_19 (34) = happyShift action_35
action_19 _ = happyReduce_28

action_20 (32) = happyShift action_58
action_20 _ = happyFail

action_21 (28) = happyShift action_54
action_21 (29) = happyShift action_55
action_21 (36) = happyShift action_56
action_21 (42) = happyShift action_57
action_21 (10) = happyGoto action_52
action_21 (11) = happyGoto action_53
action_21 _ = happyFail

action_22 (21) = happyShift action_30
action_22 (22) = happyShift action_31
action_22 (23) = happyShift action_32
action_22 (24) = happyShift action_33
action_22 (30) = happyShift action_34
action_22 (34) = happyShift action_35
action_22 (35) = happyShift action_51
action_22 _ = happyFail

action_23 (35) = happyShift action_50
action_23 _ = happyFail

action_24 (25) = happyShift action_26
action_24 (32) = happyShift action_49
action_24 _ = happyReduce_5

action_25 (38) = happyShift action_48
action_25 _ = happyFail

action_26 (12) = happyShift action_2
action_26 (13) = happyShift action_5
action_26 (14) = happyShift action_6
action_26 (15) = happyShift action_7
action_26 (16) = happyShift action_8
action_26 (18) = happyShift action_9
action_26 (20) = happyShift action_10
action_26 (26) = happyShift action_11
action_26 (27) = happyShift action_12
action_26 (34) = happyShift action_13
action_26 (36) = happyShift action_14
action_26 (38) = happyShift action_15
action_26 (4) = happyGoto action_47
action_26 (5) = happyGoto action_4
action_26 _ = happyFail

action_27 (26) = happyShift action_46
action_27 _ = happyFail

action_28 (21) = happyShift action_30
action_28 (22) = happyShift action_31
action_28 (23) = happyShift action_32
action_28 (24) = happyShift action_33
action_28 (30) = happyShift action_34
action_28 (34) = happyShift action_35
action_28 (38) = happyShift action_45
action_28 _ = happyFail

action_29 (21) = happyShift action_30
action_29 (22) = happyShift action_31
action_29 (23) = happyShift action_32
action_29 (24) = happyShift action_33
action_29 (30) = happyShift action_34
action_29 (34) = happyShift action_35
action_29 (38) = happyShift action_44
action_29 _ = happyFail

action_30 (12) = happyShift action_2
action_30 (13) = happyShift action_5
action_30 (14) = happyShift action_6
action_30 (15) = happyShift action_7
action_30 (16) = happyShift action_8
action_30 (18) = happyShift action_9
action_30 (20) = happyShift action_10
action_30 (26) = happyShift action_11
action_30 (27) = happyShift action_12
action_30 (34) = happyShift action_13
action_30 (36) = happyShift action_14
action_30 (38) = happyShift action_15
action_30 (4) = happyGoto action_43
action_30 (5) = happyGoto action_4
action_30 _ = happyFail

action_31 (12) = happyShift action_2
action_31 (13) = happyShift action_5
action_31 (14) = happyShift action_6
action_31 (15) = happyShift action_7
action_31 (16) = happyShift action_8
action_31 (18) = happyShift action_9
action_31 (20) = happyShift action_10
action_31 (26) = happyShift action_11
action_31 (27) = happyShift action_12
action_31 (34) = happyShift action_13
action_31 (36) = happyShift action_14
action_31 (38) = happyShift action_15
action_31 (4) = happyGoto action_42
action_31 (5) = happyGoto action_4
action_31 _ = happyFail

action_32 (12) = happyShift action_2
action_32 (13) = happyShift action_5
action_32 (14) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (16) = happyShift action_8
action_32 (18) = happyShift action_9
action_32 (20) = happyShift action_10
action_32 (26) = happyShift action_11
action_32 (27) = happyShift action_12
action_32 (34) = happyShift action_13
action_32 (36) = happyShift action_14
action_32 (38) = happyShift action_15
action_32 (4) = happyGoto action_41
action_32 (5) = happyGoto action_4
action_32 _ = happyFail

action_33 (12) = happyShift action_2
action_33 (13) = happyShift action_5
action_33 (14) = happyShift action_6
action_33 (15) = happyShift action_7
action_33 (16) = happyShift action_8
action_33 (18) = happyShift action_9
action_33 (20) = happyShift action_10
action_33 (26) = happyShift action_11
action_33 (27) = happyShift action_12
action_33 (34) = happyShift action_13
action_33 (36) = happyShift action_14
action_33 (38) = happyShift action_15
action_33 (4) = happyGoto action_40
action_33 (5) = happyGoto action_4
action_33 _ = happyFail

action_34 (26) = happyShift action_39
action_34 _ = happyFail

action_35 (12) = happyShift action_2
action_35 (13) = happyShift action_5
action_35 (14) = happyShift action_6
action_35 (15) = happyShift action_7
action_35 (16) = happyShift action_8
action_35 (18) = happyShift action_9
action_35 (20) = happyShift action_10
action_35 (26) = happyShift action_11
action_35 (27) = happyShift action_12
action_35 (34) = happyShift action_13
action_35 (35) = happyShift action_38
action_35 (36) = happyShift action_14
action_35 (38) = happyShift action_15
action_35 (4) = happyGoto action_36
action_35 (5) = happyGoto action_4
action_35 (8) = happyGoto action_37
action_35 _ = happyFail

action_36 (21) = happyShift action_30
action_36 (22) = happyShift action_31
action_36 (23) = happyShift action_32
action_36 (24) = happyShift action_33
action_36 (30) = happyShift action_34
action_36 (31) = happyShift action_80
action_36 (34) = happyShift action_35
action_36 _ = happyReduce_32

action_37 (35) = happyShift action_79
action_37 _ = happyFail

action_38 _ = happyReduce_11

action_39 _ = happyReduce_17

action_40 (30) = happyShift action_34
action_40 (34) = happyShift action_35
action_40 _ = happyReduce_22

action_41 (22) = happyShift action_31
action_41 (24) = happyShift action_33
action_41 (30) = happyShift action_34
action_41 (34) = happyShift action_35
action_41 _ = happyReduce_20

action_42 (30) = happyShift action_34
action_42 (34) = happyShift action_35
action_42 _ = happyReduce_21

action_43 (22) = happyShift action_31
action_43 (24) = happyShift action_33
action_43 (30) = happyShift action_34
action_43 (34) = happyShift action_35
action_43 _ = happyReduce_19

action_44 (12) = happyShift action_2
action_44 (13) = happyShift action_5
action_44 (14) = happyShift action_6
action_44 (15) = happyShift action_7
action_44 (16) = happyShift action_8
action_44 (18) = happyShift action_9
action_44 (20) = happyShift action_10
action_44 (26) = happyShift action_11
action_44 (27) = happyShift action_12
action_44 (34) = happyShift action_13
action_44 (36) = happyShift action_14
action_44 (38) = happyShift action_15
action_44 (4) = happyGoto action_78
action_44 (5) = happyGoto action_4
action_44 _ = happyFail

action_45 (12) = happyShift action_2
action_45 (13) = happyShift action_5
action_45 (14) = happyShift action_6
action_45 (15) = happyShift action_7
action_45 (16) = happyShift action_8
action_45 (18) = happyShift action_9
action_45 (20) = happyShift action_10
action_45 (26) = happyShift action_11
action_45 (27) = happyShift action_12
action_45 (34) = happyShift action_13
action_45 (36) = happyShift action_14
action_45 (38) = happyShift action_15
action_45 (4) = happyGoto action_77
action_45 (5) = happyGoto action_4
action_45 _ = happyFail

action_46 (33) = happyShift action_76
action_46 _ = happyFail

action_47 (19) = happyShift action_74
action_47 (21) = happyShift action_30
action_47 (22) = happyShift action_31
action_47 (23) = happyShift action_32
action_47 (24) = happyShift action_33
action_47 (26) = happyShift action_75
action_47 (30) = happyShift action_34
action_47 (34) = happyShift action_35
action_47 (5) = happyGoto action_73
action_47 _ = happyFail

action_48 (12) = happyShift action_2
action_48 (13) = happyShift action_5
action_48 (14) = happyShift action_6
action_48 (15) = happyShift action_7
action_48 (16) = happyShift action_8
action_48 (18) = happyShift action_9
action_48 (20) = happyShift action_10
action_48 (26) = happyShift action_11
action_48 (27) = happyShift action_12
action_48 (34) = happyShift action_13
action_48 (36) = happyShift action_14
action_48 (38) = happyShift action_15
action_48 (4) = happyGoto action_72
action_48 (5) = happyGoto action_4
action_48 _ = happyFail

action_49 (28) = happyShift action_54
action_49 (29) = happyShift action_55
action_49 (36) = happyShift action_56
action_49 (42) = happyShift action_57
action_49 (10) = happyGoto action_71
action_49 (11) = happyGoto action_53
action_49 _ = happyFail

action_50 (38) = happyShift action_70
action_50 _ = happyFail

action_51 _ = happyReduce_23

action_52 (31) = happyShift action_68
action_52 (37) = happyShift action_69
action_52 _ = happyReduce_41

action_53 (42) = happyShift action_67
action_53 _ = happyFail

action_54 _ = happyReduce_35

action_55 _ = happyReduce_36

action_56 (28) = happyShift action_54
action_56 (29) = happyShift action_55
action_56 (36) = happyShift action_56
action_56 (42) = happyShift action_57
action_56 (10) = happyGoto action_66
action_56 (11) = happyGoto action_53
action_56 _ = happyFail

action_57 (28) = happyShift action_54
action_57 (29) = happyShift action_55
action_57 (36) = happyShift action_56
action_57 (42) = happyShift action_57
action_57 (10) = happyGoto action_65
action_57 (11) = happyGoto action_53
action_57 _ = happyFail

action_58 (28) = happyShift action_54
action_58 (29) = happyShift action_55
action_58 (36) = happyShift action_56
action_58 (42) = happyShift action_57
action_58 (10) = happyGoto action_64
action_58 (11) = happyGoto action_53
action_58 _ = happyFail

action_59 (12) = happyShift action_2
action_59 (13) = happyShift action_5
action_59 (14) = happyShift action_6
action_59 (15) = happyShift action_7
action_59 (16) = happyShift action_8
action_59 (18) = happyShift action_9
action_59 (20) = happyShift action_10
action_59 (26) = happyShift action_11
action_59 (27) = happyShift action_12
action_59 (34) = happyShift action_13
action_59 (36) = happyShift action_14
action_59 (38) = happyShift action_15
action_59 (4) = happyGoto action_19
action_59 (5) = happyGoto action_4
action_59 (6) = happyGoto action_63
action_59 _ = happyFail

action_60 (12) = happyShift action_2
action_60 (13) = happyShift action_5
action_60 (14) = happyShift action_6
action_60 (15) = happyShift action_7
action_60 (16) = happyShift action_8
action_60 (18) = happyShift action_9
action_60 (20) = happyShift action_10
action_60 (26) = happyShift action_11
action_60 (27) = happyShift action_12
action_60 (34) = happyShift action_13
action_60 (36) = happyShift action_14
action_60 (38) = happyShift action_15
action_60 (4) = happyGoto action_62
action_60 (5) = happyGoto action_4
action_60 _ = happyFail

action_61 _ = happyReduce_14

action_62 (21) = happyShift action_30
action_62 (22) = happyShift action_31
action_62 (23) = happyShift action_32
action_62 (24) = happyShift action_33
action_62 (30) = happyShift action_34
action_62 (31) = happyShift action_94
action_62 (34) = happyShift action_35
action_62 _ = happyReduce_34

action_63 _ = happyReduce_27

action_64 (31) = happyShift action_68
action_64 (37) = happyShift action_93
action_64 _ = happyReduce_41

action_65 (31) = happyShift action_68
action_65 (42) = happyReduce_41
action_65 _ = happyReduce_38

action_66 (31) = happyShift action_68
action_66 (37) = happyShift action_92
action_66 _ = happyReduce_41

action_67 (28) = happyShift action_54
action_67 (29) = happyShift action_55
action_67 (36) = happyShift action_56
action_67 (42) = happyShift action_57
action_67 (10) = happyGoto action_91
action_67 (11) = happyGoto action_53
action_67 _ = happyFail

action_68 (28) = happyShift action_54
action_68 (29) = happyShift action_55
action_68 (36) = happyShift action_56
action_68 (42) = happyShift action_57
action_68 (10) = happyGoto action_89
action_68 (11) = happyGoto action_90
action_68 _ = happyFail

action_69 _ = happyReduce_7

action_70 (12) = happyShift action_2
action_70 (13) = happyShift action_5
action_70 (14) = happyShift action_6
action_70 (15) = happyShift action_7
action_70 (16) = happyShift action_8
action_70 (18) = happyShift action_9
action_70 (20) = happyShift action_10
action_70 (26) = happyShift action_11
action_70 (27) = happyShift action_12
action_70 (34) = happyShift action_13
action_70 (36) = happyShift action_14
action_70 (38) = happyShift action_15
action_70 (4) = happyGoto action_88
action_70 (5) = happyGoto action_4
action_70 _ = happyFail

action_71 (31) = happyShift action_87
action_71 (42) = happyReduce_41
action_71 _ = happyReduce_30

action_72 (21) = happyShift action_30
action_72 (22) = happyShift action_31
action_72 (23) = happyShift action_32
action_72 (24) = happyShift action_33
action_72 (30) = happyShift action_34
action_72 (34) = happyShift action_35
action_72 (39) = happyShift action_86
action_72 _ = happyFail

action_73 _ = happyReduce_25

action_74 (12) = happyShift action_2
action_74 (13) = happyShift action_5
action_74 (14) = happyShift action_6
action_74 (15) = happyShift action_7
action_74 (16) = happyShift action_8
action_74 (18) = happyShift action_9
action_74 (20) = happyShift action_10
action_74 (26) = happyShift action_11
action_74 (27) = happyShift action_12
action_74 (34) = happyShift action_13
action_74 (36) = happyShift action_14
action_74 (38) = happyShift action_15
action_74 (4) = happyGoto action_85
action_74 (5) = happyGoto action_4
action_74 _ = happyFail

action_75 (25) = happyShift action_26
action_75 _ = happyFail

action_76 (28) = happyShift action_54
action_76 (29) = happyShift action_55
action_76 (36) = happyShift action_56
action_76 (42) = happyShift action_57
action_76 (10) = happyGoto action_84
action_76 (11) = happyGoto action_53
action_76 _ = happyFail

action_77 (21) = happyShift action_30
action_77 (22) = happyShift action_31
action_77 (23) = happyShift action_32
action_77 (24) = happyShift action_33
action_77 (30) = happyShift action_34
action_77 (34) = happyShift action_35
action_77 (39) = happyShift action_83
action_77 _ = happyFail

action_78 (21) = happyShift action_30
action_78 (22) = happyShift action_31
action_78 (23) = happyShift action_32
action_78 (24) = happyShift action_33
action_78 (30) = happyShift action_34
action_78 (34) = happyShift action_35
action_78 (39) = happyShift action_82
action_78 _ = happyFail

action_79 _ = happyReduce_12

action_80 (12) = happyShift action_2
action_80 (13) = happyShift action_5
action_80 (14) = happyShift action_6
action_80 (15) = happyShift action_7
action_80 (16) = happyShift action_8
action_80 (18) = happyShift action_9
action_80 (20) = happyShift action_10
action_80 (26) = happyShift action_11
action_80 (27) = happyShift action_12
action_80 (34) = happyShift action_13
action_80 (36) = happyShift action_14
action_80 (38) = happyShift action_15
action_80 (4) = happyGoto action_36
action_80 (5) = happyGoto action_4
action_80 (8) = happyGoto action_81
action_80 _ = happyFail

action_81 _ = happyReduce_31

action_82 (17) = happyShift action_101
action_82 _ = happyFail

action_83 (34) = happyShift action_100
action_83 _ = happyFail

action_84 (31) = happyShift action_68
action_84 (33) = happyShift action_99
action_84 _ = happyReduce_41

action_85 (21) = happyShift action_30
action_85 (22) = happyShift action_31
action_85 (23) = happyShift action_32
action_85 (24) = happyShift action_33
action_85 (30) = happyShift action_34
action_85 (34) = happyShift action_35
action_85 _ = happyReduce_26

action_86 _ = happyReduce_9

action_87 (26) = happyShift action_98
action_87 (28) = happyShift action_54
action_87 (29) = happyShift action_55
action_87 (36) = happyShift action_56
action_87 (42) = happyShift action_57
action_87 (7) = happyGoto action_97
action_87 (10) = happyGoto action_89
action_87 (11) = happyGoto action_90
action_87 _ = happyFail

action_88 (21) = happyShift action_30
action_88 (22) = happyShift action_31
action_88 (23) = happyShift action_32
action_88 (24) = happyShift action_33
action_88 (30) = happyShift action_34
action_88 (34) = happyShift action_35
action_88 (39) = happyShift action_96
action_88 _ = happyFail

action_89 (31) = happyShift action_68
action_89 _ = happyReduce_41

action_90 (42) = happyShift action_67
action_90 _ = happyFail

action_91 (31) = happyShift action_68
action_91 (42) = happyReduce_41
action_91 _ = happyReduce_39

action_92 _ = happyReduce_37

action_93 _ = happyReduce_8

action_94 (26) = happyShift action_17
action_94 (9) = happyGoto action_95
action_94 _ = happyFail

action_95 _ = happyReduce_33

action_96 _ = happyReduce_10

action_97 _ = happyReduce_29

action_98 (32) = happyShift action_49
action_98 _ = happyFail

action_99 (12) = happyShift action_2
action_99 (13) = happyShift action_5
action_99 (14) = happyShift action_6
action_99 (15) = happyShift action_7
action_99 (16) = happyShift action_8
action_99 (18) = happyShift action_9
action_99 (20) = happyShift action_10
action_99 (26) = happyShift action_11
action_99 (27) = happyShift action_12
action_99 (34) = happyShift action_13
action_99 (36) = happyShift action_14
action_99 (38) = happyShift action_15
action_99 (4) = happyGoto action_104
action_99 (5) = happyGoto action_4
action_99 _ = happyFail

action_100 (26) = happyShift action_103
action_100 _ = happyFail

action_101 (38) = happyShift action_102
action_101 _ = happyFail

action_102 (12) = happyShift action_2
action_102 (13) = happyShift action_5
action_102 (14) = happyShift action_6
action_102 (15) = happyShift action_7
action_102 (16) = happyShift action_8
action_102 (18) = happyShift action_9
action_102 (20) = happyShift action_10
action_102 (26) = happyShift action_11
action_102 (27) = happyShift action_12
action_102 (34) = happyShift action_13
action_102 (36) = happyShift action_14
action_102 (38) = happyShift action_15
action_102 (4) = happyGoto action_107
action_102 (5) = happyGoto action_4
action_102 _ = happyFail

action_103 (26) = happyShift action_106
action_103 _ = happyFail

action_104 (21) = happyShift action_30
action_104 (22) = happyShift action_31
action_104 (23) = happyShift action_32
action_104 (24) = happyShift action_33
action_104 (30) = happyShift action_34
action_104 (34) = happyShift action_35
action_104 (41) = happyShift action_105
action_104 _ = happyFail

action_105 _ = happyReduce_24

action_106 (35) = happyShift action_109
action_106 _ = happyFail

action_107 (21) = happyShift action_30
action_107 (22) = happyShift action_31
action_107 (23) = happyShift action_32
action_107 (24) = happyShift action_33
action_107 (30) = happyShift action_34
action_107 (34) = happyShift action_35
action_107 (39) = happyShift action_108
action_107 _ = happyFail

action_108 _ = happyReduce_15

action_109 (38) = happyShift action_110
action_109 _ = happyFail

action_110 (12) = happyShift action_2
action_110 (13) = happyShift action_5
action_110 (14) = happyShift action_6
action_110 (15) = happyShift action_7
action_110 (16) = happyShift action_8
action_110 (18) = happyShift action_9
action_110 (20) = happyShift action_10
action_110 (26) = happyShift action_11
action_110 (27) = happyShift action_12
action_110 (34) = happyShift action_13
action_110 (36) = happyShift action_14
action_110 (38) = happyShift action_15
action_110 (4) = happyGoto action_111
action_110 (5) = happyGoto action_4
action_110 _ = happyFail

action_111 (21) = happyShift action_30
action_111 (22) = happyShift action_31
action_111 (23) = happyShift action_32
action_111 (24) = happyShift action_33
action_111 (30) = happyShift action_34
action_111 (34) = happyShift action_35
action_111 (39) = happyShift action_112
action_111 _ = happyFail

action_112 _ = happyReduce_16

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn4
		 (EInt happy_var_1
	)
happyReduction_1 _  = notHappyAtAll

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenDouble happy_var_1))
	 =  HappyAbsSyn4
		 (EDouble happy_var_1
	)
happyReduction_2 _  = notHappyAtAll

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (EBool True
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (EBool False
	)

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (EVar (Var happy_var_1)
	)
happyReduction_5 _  = notHappyAtAll

happyReduce_6 = happySpecReduce_1  4 happyReduction_6
happyReduction_6 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn4
		 (EString happy_var_1
	)
happyReduction_6 _  = notHappyAtAll

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EList happy_var_3 []
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 5 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EList happy_var_4 happy_var_2
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 5 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELam [] happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELam happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 _
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EApp happy_var_1 []
	)
happyReduction_11 _ _ _  = notHappyAtAll

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_2  4 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn4
		 (EObject M.empty
	)

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (EObject (M.fromList happy_var_2)
	)
happyReduction_14 _ _ _  = notHappyAtAll

happyReduce_15 = happyReduce 9 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EIf happy_var_2 happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 12 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_8)) `HappyStk`
	(HappyTerminal (TokenVar happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ECase happy_var_2 happy_var_4 (Var happy_var_7) (Var happy_var_8) happy_var_11
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyTerminal (TokenVar happy_var_3))
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EDot happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll

happyReduce_18 = happySpecReduce_1  4 happyReduction_18
happyReduction_18 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PPlus [happy_var_1, happy_var_3]
	)
happyReduction_19 _ _ _  = notHappyAtAll

happyReduce_20 = happySpecReduce_3  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PMinus [happy_var_1, happy_var_3]
	)
happyReduction_20 _ _ _  = notHappyAtAll

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PTimes [happy_var_1, happy_var_3]
	)
happyReduction_21 _ _ _  = notHappyAtAll

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PDivide [happy_var_1, happy_var_3]
	)
happyReduction_22 _ _ _  = notHappyAtAll

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll

happyReduce_24 = happyReduce 8 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ESource (ES (Id happy_var_3) happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 4 5 happyReduction_25
happyReduction_25 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet (Var happy_var_1) happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 5 5 happyReduction_26
happyReduction_26 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet (Var happy_var_1) happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_3  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll

happyReduce_28 = happySpecReduce_1  6 happyReduction_28
happyReduction_28 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll

happyReduce_29 = happyReduce 5 7 happyReduction_29
happyReduction_29 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((Var happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  7 happyReduction_30
happyReduction_30 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn7
		 ([(Var happy_var_1, happy_var_3)]
	)
happyReduction_30 _ _ _  = notHappyAtAll

happyReduce_31 = happySpecReduce_3  8 happyReduction_31
happyReduction_31 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll

happyReduce_32 = happySpecReduce_1  8 happyReduction_32
happyReduction_32 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_32 _  = notHappyAtAll

happyReduce_33 = happyReduce 5 9 happyReduction_33
happyReduction_33 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_1,happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_3  9 happyReduction_34
happyReduction_34 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_34 _ _ _  = notHappyAtAll

happyReduce_35 = happySpecReduce_1  10 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn10
		 (TInt
	)

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn10
		 (TString
	)

happyReduce_37 = happySpecReduce_3  10 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TList happy_var_2
	)
happyReduction_37 _ _ _  = notHappyAtAll

happyReduce_38 = happySpecReduce_2  10 happyReduction_38
happyReduction_38 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TLam [] happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll

happyReduce_39 = happySpecReduce_3  10 happyReduction_39
happyReduction_39 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (TLam happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll

happyReduce_40 = happySpecReduce_3  11 happyReduction_40
happyReduction_40 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll

happyReduce_41 = happySpecReduce_1  11 happyReduction_41
happyReduction_41 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 12;
	TokenDouble happy_dollar_dollar -> cont 13;
	TokenTrue -> cont 14;
	TokenFalse -> cont 15;
	TokenIf -> cont 16;
	TokenElse -> cont 17;
	TokenCase -> cont 18;
	TokenIn -> cont 19;
	TokenSource -> cont 20;
	TokenPlus -> cont 21;
	TokenTimes -> cont 22;
	TokenMinus -> cont 23;
	TokenDivide -> cont 24;
	TokenEqual -> cont 25;
	TokenVar happy_dollar_dollar -> cont 26;
	TokenString happy_dollar_dollar -> cont 27;
	TokenTInt -> cont 28;
	TokenTString -> cont 29;
	TokenDot -> cont 30;
	TokenComma -> cont 31;
	TokenColon -> cont 32;
	TokenSemiColon -> cont 33;
	TokenPO -> cont 34;
	TokenPC -> cont 35;
	TokenSBO -> cont 36;
	TokenSBC -> cont 37;
	TokenBO -> cont 38;
	TokenBC -> cont 39;
	TokenAO -> cont 40;
	TokenAC -> cont 41;
	TokenArrow -> cont 42;
	_ -> happyError' (tk:tks)
	}

happyError_ 43 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts))
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
