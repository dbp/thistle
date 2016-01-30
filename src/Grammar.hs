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
action_0 (27) = happyShift action_11
action_0 (28) = happyShift action_12
action_0 (35) = happyShift action_13
action_0 (37) = happyShift action_14
action_0 (39) = happyShift action_15
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
action_3 (26) = happyShift action_34
action_3 (31) = happyShift action_35
action_3 (35) = happyShift action_36
action_3 (44) = happyAccept
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
action_8 (27) = happyShift action_11
action_8 (28) = happyShift action_12
action_8 (35) = happyShift action_13
action_8 (37) = happyShift action_14
action_8 (39) = happyShift action_15
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
action_9 (27) = happyShift action_11
action_9 (28) = happyShift action_12
action_9 (35) = happyShift action_13
action_9 (37) = happyShift action_14
action_9 (39) = happyShift action_15
action_9 (4) = happyGoto action_28
action_9 (5) = happyGoto action_4
action_9 _ = happyFail

action_10 (41) = happyShift action_27
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
action_13 (27) = happyShift action_24
action_13 (28) = happyShift action_12
action_13 (35) = happyShift action_13
action_13 (36) = happyShift action_25
action_13 (37) = happyShift action_14
action_13 (39) = happyShift action_15
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
action_14 (27) = happyShift action_11
action_14 (28) = happyShift action_12
action_14 (33) = happyShift action_21
action_14 (35) = happyShift action_13
action_14 (37) = happyShift action_14
action_14 (39) = happyShift action_15
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 (6) = happyGoto action_20
action_14 _ = happyFail

action_15 (27) = happyShift action_17
action_15 (40) = happyShift action_18
action_15 (9) = happyGoto action_16
action_15 _ = happyFail

action_16 (40) = happyShift action_63
action_16 _ = happyFail

action_17 (33) = happyShift action_62
action_17 _ = happyFail

action_18 _ = happyReduce_13

action_19 (21) = happyShift action_30
action_19 (22) = happyShift action_31
action_19 (23) = happyShift action_32
action_19 (24) = happyShift action_33
action_19 (26) = happyShift action_34
action_19 (31) = happyShift action_35
action_19 (32) = happyShift action_61
action_19 (35) = happyShift action_36
action_19 _ = happyReduce_29

action_20 (33) = happyShift action_60
action_20 _ = happyFail

action_21 (29) = happyShift action_56
action_21 (30) = happyShift action_57
action_21 (37) = happyShift action_58
action_21 (43) = happyShift action_59
action_21 (10) = happyGoto action_54
action_21 (11) = happyGoto action_55
action_21 _ = happyFail

action_22 (21) = happyShift action_30
action_22 (22) = happyShift action_31
action_22 (23) = happyShift action_32
action_22 (24) = happyShift action_33
action_22 (26) = happyShift action_34
action_22 (31) = happyShift action_35
action_22 (35) = happyShift action_36
action_22 (36) = happyShift action_53
action_22 _ = happyFail

action_23 (36) = happyShift action_52
action_23 _ = happyFail

action_24 (25) = happyShift action_26
action_24 (33) = happyShift action_51
action_24 _ = happyReduce_5

action_25 (39) = happyShift action_50
action_25 _ = happyFail

action_26 (12) = happyShift action_2
action_26 (13) = happyShift action_5
action_26 (14) = happyShift action_6
action_26 (15) = happyShift action_7
action_26 (16) = happyShift action_8
action_26 (18) = happyShift action_9
action_26 (20) = happyShift action_10
action_26 (27) = happyShift action_11
action_26 (28) = happyShift action_12
action_26 (35) = happyShift action_13
action_26 (37) = happyShift action_14
action_26 (39) = happyShift action_15
action_26 (4) = happyGoto action_49
action_26 (5) = happyGoto action_4
action_26 _ = happyFail

action_27 (27) = happyShift action_48
action_27 _ = happyFail

action_28 (21) = happyShift action_30
action_28 (22) = happyShift action_31
action_28 (23) = happyShift action_32
action_28 (24) = happyShift action_33
action_28 (26) = happyShift action_34
action_28 (31) = happyShift action_35
action_28 (35) = happyShift action_36
action_28 (39) = happyShift action_47
action_28 _ = happyFail

action_29 (21) = happyShift action_30
action_29 (22) = happyShift action_31
action_29 (23) = happyShift action_32
action_29 (24) = happyShift action_33
action_29 (26) = happyShift action_34
action_29 (31) = happyShift action_35
action_29 (35) = happyShift action_36
action_29 (39) = happyShift action_46
action_29 _ = happyFail

action_30 (12) = happyShift action_2
action_30 (13) = happyShift action_5
action_30 (14) = happyShift action_6
action_30 (15) = happyShift action_7
action_30 (16) = happyShift action_8
action_30 (18) = happyShift action_9
action_30 (20) = happyShift action_10
action_30 (27) = happyShift action_11
action_30 (28) = happyShift action_12
action_30 (35) = happyShift action_13
action_30 (37) = happyShift action_14
action_30 (39) = happyShift action_15
action_30 (4) = happyGoto action_45
action_30 (5) = happyGoto action_4
action_30 _ = happyFail

action_31 (12) = happyShift action_2
action_31 (13) = happyShift action_5
action_31 (14) = happyShift action_6
action_31 (15) = happyShift action_7
action_31 (16) = happyShift action_8
action_31 (18) = happyShift action_9
action_31 (20) = happyShift action_10
action_31 (27) = happyShift action_11
action_31 (28) = happyShift action_12
action_31 (35) = happyShift action_13
action_31 (37) = happyShift action_14
action_31 (39) = happyShift action_15
action_31 (4) = happyGoto action_44
action_31 (5) = happyGoto action_4
action_31 _ = happyFail

action_32 (12) = happyShift action_2
action_32 (13) = happyShift action_5
action_32 (14) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (16) = happyShift action_8
action_32 (18) = happyShift action_9
action_32 (20) = happyShift action_10
action_32 (27) = happyShift action_11
action_32 (28) = happyShift action_12
action_32 (35) = happyShift action_13
action_32 (37) = happyShift action_14
action_32 (39) = happyShift action_15
action_32 (4) = happyGoto action_43
action_32 (5) = happyGoto action_4
action_32 _ = happyFail

action_33 (12) = happyShift action_2
action_33 (13) = happyShift action_5
action_33 (14) = happyShift action_6
action_33 (15) = happyShift action_7
action_33 (16) = happyShift action_8
action_33 (18) = happyShift action_9
action_33 (20) = happyShift action_10
action_33 (27) = happyShift action_11
action_33 (28) = happyShift action_12
action_33 (35) = happyShift action_13
action_33 (37) = happyShift action_14
action_33 (39) = happyShift action_15
action_33 (4) = happyGoto action_42
action_33 (5) = happyGoto action_4
action_33 _ = happyFail

action_34 (12) = happyShift action_2
action_34 (13) = happyShift action_5
action_34 (14) = happyShift action_6
action_34 (15) = happyShift action_7
action_34 (16) = happyShift action_8
action_34 (18) = happyShift action_9
action_34 (20) = happyShift action_10
action_34 (27) = happyShift action_11
action_34 (28) = happyShift action_12
action_34 (35) = happyShift action_13
action_34 (37) = happyShift action_14
action_34 (39) = happyShift action_15
action_34 (4) = happyGoto action_41
action_34 (5) = happyGoto action_4
action_34 _ = happyFail

action_35 (27) = happyShift action_40
action_35 _ = happyFail

action_36 (12) = happyShift action_2
action_36 (13) = happyShift action_5
action_36 (14) = happyShift action_6
action_36 (15) = happyShift action_7
action_36 (16) = happyShift action_8
action_36 (18) = happyShift action_9
action_36 (20) = happyShift action_10
action_36 (27) = happyShift action_11
action_36 (28) = happyShift action_12
action_36 (35) = happyShift action_13
action_36 (36) = happyShift action_39
action_36 (37) = happyShift action_14
action_36 (39) = happyShift action_15
action_36 (4) = happyGoto action_37
action_36 (5) = happyGoto action_4
action_36 (8) = happyGoto action_38
action_36 _ = happyFail

action_37 (21) = happyShift action_30
action_37 (22) = happyShift action_31
action_37 (23) = happyShift action_32
action_37 (24) = happyShift action_33
action_37 (26) = happyShift action_34
action_37 (31) = happyShift action_35
action_37 (32) = happyShift action_82
action_37 (35) = happyShift action_36
action_37 _ = happyReduce_33

action_38 (36) = happyShift action_81
action_38 _ = happyFail

action_39 _ = happyReduce_11

action_40 _ = happyReduce_17

action_41 (21) = happyShift action_30
action_41 (22) = happyShift action_31
action_41 (23) = happyShift action_32
action_41 (24) = happyShift action_33
action_41 (31) = happyShift action_35
action_41 (35) = happyShift action_36
action_41 _ = happyReduce_19

action_42 (31) = happyShift action_35
action_42 (35) = happyShift action_36
action_42 _ = happyReduce_23

action_43 (22) = happyShift action_31
action_43 (24) = happyShift action_33
action_43 (31) = happyShift action_35
action_43 (35) = happyShift action_36
action_43 _ = happyReduce_21

action_44 (31) = happyShift action_35
action_44 (35) = happyShift action_36
action_44 _ = happyReduce_22

action_45 (22) = happyShift action_31
action_45 (24) = happyShift action_33
action_45 (31) = happyShift action_35
action_45 (35) = happyShift action_36
action_45 _ = happyReduce_20

action_46 (12) = happyShift action_2
action_46 (13) = happyShift action_5
action_46 (14) = happyShift action_6
action_46 (15) = happyShift action_7
action_46 (16) = happyShift action_8
action_46 (18) = happyShift action_9
action_46 (20) = happyShift action_10
action_46 (27) = happyShift action_11
action_46 (28) = happyShift action_12
action_46 (35) = happyShift action_13
action_46 (37) = happyShift action_14
action_46 (39) = happyShift action_15
action_46 (4) = happyGoto action_80
action_46 (5) = happyGoto action_4
action_46 _ = happyFail

action_47 (12) = happyShift action_2
action_47 (13) = happyShift action_5
action_47 (14) = happyShift action_6
action_47 (15) = happyShift action_7
action_47 (16) = happyShift action_8
action_47 (18) = happyShift action_9
action_47 (20) = happyShift action_10
action_47 (27) = happyShift action_11
action_47 (28) = happyShift action_12
action_47 (35) = happyShift action_13
action_47 (37) = happyShift action_14
action_47 (39) = happyShift action_15
action_47 (4) = happyGoto action_79
action_47 (5) = happyGoto action_4
action_47 _ = happyFail

action_48 (34) = happyShift action_78
action_48 _ = happyFail

action_49 (19) = happyShift action_76
action_49 (21) = happyShift action_30
action_49 (22) = happyShift action_31
action_49 (23) = happyShift action_32
action_49 (24) = happyShift action_33
action_49 (26) = happyShift action_34
action_49 (27) = happyShift action_77
action_49 (31) = happyShift action_35
action_49 (35) = happyShift action_36
action_49 (5) = happyGoto action_75
action_49 _ = happyFail

action_50 (12) = happyShift action_2
action_50 (13) = happyShift action_5
action_50 (14) = happyShift action_6
action_50 (15) = happyShift action_7
action_50 (16) = happyShift action_8
action_50 (18) = happyShift action_9
action_50 (20) = happyShift action_10
action_50 (27) = happyShift action_11
action_50 (28) = happyShift action_12
action_50 (35) = happyShift action_13
action_50 (37) = happyShift action_14
action_50 (39) = happyShift action_15
action_50 (4) = happyGoto action_74
action_50 (5) = happyGoto action_4
action_50 _ = happyFail

action_51 (29) = happyShift action_56
action_51 (30) = happyShift action_57
action_51 (37) = happyShift action_58
action_51 (43) = happyShift action_59
action_51 (10) = happyGoto action_73
action_51 (11) = happyGoto action_55
action_51 _ = happyFail

action_52 (39) = happyShift action_72
action_52 _ = happyFail

action_53 _ = happyReduce_24

action_54 (32) = happyShift action_70
action_54 (38) = happyShift action_71
action_54 _ = happyReduce_42

action_55 (43) = happyShift action_69
action_55 _ = happyFail

action_56 _ = happyReduce_36

action_57 _ = happyReduce_37

action_58 (29) = happyShift action_56
action_58 (30) = happyShift action_57
action_58 (37) = happyShift action_58
action_58 (43) = happyShift action_59
action_58 (10) = happyGoto action_68
action_58 (11) = happyGoto action_55
action_58 _ = happyFail

action_59 (29) = happyShift action_56
action_59 (30) = happyShift action_57
action_59 (37) = happyShift action_58
action_59 (43) = happyShift action_59
action_59 (10) = happyGoto action_67
action_59 (11) = happyGoto action_55
action_59 _ = happyFail

action_60 (29) = happyShift action_56
action_60 (30) = happyShift action_57
action_60 (37) = happyShift action_58
action_60 (43) = happyShift action_59
action_60 (10) = happyGoto action_66
action_60 (11) = happyGoto action_55
action_60 _ = happyFail

action_61 (12) = happyShift action_2
action_61 (13) = happyShift action_5
action_61 (14) = happyShift action_6
action_61 (15) = happyShift action_7
action_61 (16) = happyShift action_8
action_61 (18) = happyShift action_9
action_61 (20) = happyShift action_10
action_61 (27) = happyShift action_11
action_61 (28) = happyShift action_12
action_61 (35) = happyShift action_13
action_61 (37) = happyShift action_14
action_61 (39) = happyShift action_15
action_61 (4) = happyGoto action_19
action_61 (5) = happyGoto action_4
action_61 (6) = happyGoto action_65
action_61 _ = happyFail

action_62 (12) = happyShift action_2
action_62 (13) = happyShift action_5
action_62 (14) = happyShift action_6
action_62 (15) = happyShift action_7
action_62 (16) = happyShift action_8
action_62 (18) = happyShift action_9
action_62 (20) = happyShift action_10
action_62 (27) = happyShift action_11
action_62 (28) = happyShift action_12
action_62 (35) = happyShift action_13
action_62 (37) = happyShift action_14
action_62 (39) = happyShift action_15
action_62 (4) = happyGoto action_64
action_62 (5) = happyGoto action_4
action_62 _ = happyFail

action_63 _ = happyReduce_14

action_64 (21) = happyShift action_30
action_64 (22) = happyShift action_31
action_64 (23) = happyShift action_32
action_64 (24) = happyShift action_33
action_64 (26) = happyShift action_34
action_64 (31) = happyShift action_35
action_64 (32) = happyShift action_96
action_64 (35) = happyShift action_36
action_64 _ = happyReduce_35

action_65 _ = happyReduce_28

action_66 (32) = happyShift action_70
action_66 (38) = happyShift action_95
action_66 _ = happyReduce_42

action_67 (32) = happyShift action_70
action_67 (43) = happyReduce_42
action_67 _ = happyReduce_39

action_68 (32) = happyShift action_70
action_68 (38) = happyShift action_94
action_68 _ = happyReduce_42

action_69 (29) = happyShift action_56
action_69 (30) = happyShift action_57
action_69 (37) = happyShift action_58
action_69 (43) = happyShift action_59
action_69 (10) = happyGoto action_93
action_69 (11) = happyGoto action_55
action_69 _ = happyFail

action_70 (29) = happyShift action_56
action_70 (30) = happyShift action_57
action_70 (37) = happyShift action_58
action_70 (43) = happyShift action_59
action_70 (10) = happyGoto action_91
action_70 (11) = happyGoto action_92
action_70 _ = happyFail

action_71 _ = happyReduce_7

action_72 (12) = happyShift action_2
action_72 (13) = happyShift action_5
action_72 (14) = happyShift action_6
action_72 (15) = happyShift action_7
action_72 (16) = happyShift action_8
action_72 (18) = happyShift action_9
action_72 (20) = happyShift action_10
action_72 (27) = happyShift action_11
action_72 (28) = happyShift action_12
action_72 (35) = happyShift action_13
action_72 (37) = happyShift action_14
action_72 (39) = happyShift action_15
action_72 (4) = happyGoto action_90
action_72 (5) = happyGoto action_4
action_72 _ = happyFail

action_73 (32) = happyShift action_89
action_73 (43) = happyReduce_42
action_73 _ = happyReduce_31

action_74 (21) = happyShift action_30
action_74 (22) = happyShift action_31
action_74 (23) = happyShift action_32
action_74 (24) = happyShift action_33
action_74 (26) = happyShift action_34
action_74 (31) = happyShift action_35
action_74 (35) = happyShift action_36
action_74 (40) = happyShift action_88
action_74 _ = happyFail

action_75 _ = happyReduce_26

action_76 (12) = happyShift action_2
action_76 (13) = happyShift action_5
action_76 (14) = happyShift action_6
action_76 (15) = happyShift action_7
action_76 (16) = happyShift action_8
action_76 (18) = happyShift action_9
action_76 (20) = happyShift action_10
action_76 (27) = happyShift action_11
action_76 (28) = happyShift action_12
action_76 (35) = happyShift action_13
action_76 (37) = happyShift action_14
action_76 (39) = happyShift action_15
action_76 (4) = happyGoto action_87
action_76 (5) = happyGoto action_4
action_76 _ = happyFail

action_77 (25) = happyShift action_26
action_77 _ = happyFail

action_78 (29) = happyShift action_56
action_78 (30) = happyShift action_57
action_78 (37) = happyShift action_58
action_78 (43) = happyShift action_59
action_78 (10) = happyGoto action_86
action_78 (11) = happyGoto action_55
action_78 _ = happyFail

action_79 (21) = happyShift action_30
action_79 (22) = happyShift action_31
action_79 (23) = happyShift action_32
action_79 (24) = happyShift action_33
action_79 (26) = happyShift action_34
action_79 (31) = happyShift action_35
action_79 (35) = happyShift action_36
action_79 (40) = happyShift action_85
action_79 _ = happyFail

action_80 (21) = happyShift action_30
action_80 (22) = happyShift action_31
action_80 (23) = happyShift action_32
action_80 (24) = happyShift action_33
action_80 (26) = happyShift action_34
action_80 (31) = happyShift action_35
action_80 (35) = happyShift action_36
action_80 (40) = happyShift action_84
action_80 _ = happyFail

action_81 _ = happyReduce_12

action_82 (12) = happyShift action_2
action_82 (13) = happyShift action_5
action_82 (14) = happyShift action_6
action_82 (15) = happyShift action_7
action_82 (16) = happyShift action_8
action_82 (18) = happyShift action_9
action_82 (20) = happyShift action_10
action_82 (27) = happyShift action_11
action_82 (28) = happyShift action_12
action_82 (35) = happyShift action_13
action_82 (37) = happyShift action_14
action_82 (39) = happyShift action_15
action_82 (4) = happyGoto action_37
action_82 (5) = happyGoto action_4
action_82 (8) = happyGoto action_83
action_82 _ = happyFail

action_83 _ = happyReduce_32

action_84 (17) = happyShift action_103
action_84 _ = happyFail

action_85 (35) = happyShift action_102
action_85 _ = happyFail

action_86 (32) = happyShift action_70
action_86 (34) = happyShift action_101
action_86 _ = happyReduce_42

action_87 (21) = happyShift action_30
action_87 (22) = happyShift action_31
action_87 (23) = happyShift action_32
action_87 (24) = happyShift action_33
action_87 (26) = happyShift action_34
action_87 (31) = happyShift action_35
action_87 (35) = happyShift action_36
action_87 _ = happyReduce_27

action_88 _ = happyReduce_9

action_89 (27) = happyShift action_100
action_89 (29) = happyShift action_56
action_89 (30) = happyShift action_57
action_89 (37) = happyShift action_58
action_89 (43) = happyShift action_59
action_89 (7) = happyGoto action_99
action_89 (10) = happyGoto action_91
action_89 (11) = happyGoto action_92
action_89 _ = happyFail

action_90 (21) = happyShift action_30
action_90 (22) = happyShift action_31
action_90 (23) = happyShift action_32
action_90 (24) = happyShift action_33
action_90 (26) = happyShift action_34
action_90 (31) = happyShift action_35
action_90 (35) = happyShift action_36
action_90 (40) = happyShift action_98
action_90 _ = happyFail

action_91 (32) = happyShift action_70
action_91 _ = happyReduce_42

action_92 (43) = happyShift action_69
action_92 _ = happyFail

action_93 (32) = happyShift action_70
action_93 (43) = happyReduce_42
action_93 _ = happyReduce_40

action_94 _ = happyReduce_38

action_95 _ = happyReduce_8

action_96 (27) = happyShift action_17
action_96 (9) = happyGoto action_97
action_96 _ = happyFail

action_97 _ = happyReduce_34

action_98 _ = happyReduce_10

action_99 _ = happyReduce_30

action_100 (33) = happyShift action_51
action_100 _ = happyFail

action_101 (12) = happyShift action_2
action_101 (13) = happyShift action_5
action_101 (14) = happyShift action_6
action_101 (15) = happyShift action_7
action_101 (16) = happyShift action_8
action_101 (18) = happyShift action_9
action_101 (20) = happyShift action_10
action_101 (27) = happyShift action_11
action_101 (28) = happyShift action_12
action_101 (35) = happyShift action_13
action_101 (37) = happyShift action_14
action_101 (39) = happyShift action_15
action_101 (4) = happyGoto action_106
action_101 (5) = happyGoto action_4
action_101 _ = happyFail

action_102 (27) = happyShift action_105
action_102 _ = happyFail

action_103 (39) = happyShift action_104
action_103 _ = happyFail

action_104 (12) = happyShift action_2
action_104 (13) = happyShift action_5
action_104 (14) = happyShift action_6
action_104 (15) = happyShift action_7
action_104 (16) = happyShift action_8
action_104 (18) = happyShift action_9
action_104 (20) = happyShift action_10
action_104 (27) = happyShift action_11
action_104 (28) = happyShift action_12
action_104 (35) = happyShift action_13
action_104 (37) = happyShift action_14
action_104 (39) = happyShift action_15
action_104 (4) = happyGoto action_109
action_104 (5) = happyGoto action_4
action_104 _ = happyFail

action_105 (27) = happyShift action_108
action_105 _ = happyFail

action_106 (21) = happyShift action_30
action_106 (22) = happyShift action_31
action_106 (23) = happyShift action_32
action_106 (24) = happyShift action_33
action_106 (26) = happyShift action_34
action_106 (31) = happyShift action_35
action_106 (35) = happyShift action_36
action_106 (42) = happyShift action_107
action_106 _ = happyFail

action_107 _ = happyReduce_25

action_108 (36) = happyShift action_111
action_108 _ = happyFail

action_109 (21) = happyShift action_30
action_109 (22) = happyShift action_31
action_109 (23) = happyShift action_32
action_109 (24) = happyShift action_33
action_109 (26) = happyShift action_34
action_109 (31) = happyShift action_35
action_109 (35) = happyShift action_36
action_109 (40) = happyShift action_110
action_109 _ = happyFail

action_110 _ = happyReduce_15

action_111 (39) = happyShift action_112
action_111 _ = happyFail

action_112 (12) = happyShift action_2
action_112 (13) = happyShift action_5
action_112 (14) = happyShift action_6
action_112 (15) = happyShift action_7
action_112 (16) = happyShift action_8
action_112 (18) = happyShift action_9
action_112 (20) = happyShift action_10
action_112 (27) = happyShift action_11
action_112 (28) = happyShift action_12
action_112 (35) = happyShift action_13
action_112 (37) = happyShift action_14
action_112 (39) = happyShift action_15
action_112 (4) = happyGoto action_113
action_112 (5) = happyGoto action_4
action_112 _ = happyFail

action_113 (21) = happyShift action_30
action_113 (22) = happyShift action_31
action_113 (23) = happyShift action_32
action_113 (24) = happyShift action_33
action_113 (26) = happyShift action_34
action_113 (31) = happyShift action_35
action_113 (35) = happyShift action_36
action_113 (40) = happyShift action_114
action_113 _ = happyFail

action_114 _ = happyReduce_16

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
		 (EPrim PEquals [happy_var_1, happy_var_3]
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PPlus [happy_var_1, happy_var_3]
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PMinus [happy_var_1, happy_var_3]
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PTimes [happy_var_1, happy_var_3]
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (EPrim PDivide [happy_var_1, happy_var_3]
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  4 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 8 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
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

happyReduce_26 = happyReduce 4 5 happyReduction_26
happyReduction_26 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet (Var happy_var_1) happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 5 5 happyReduction_27
happyReduction_27 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet (Var happy_var_1) happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  6 happyReduction_28
happyReduction_28 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1:happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  6 happyReduction_29
happyReduction_29 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 7 happyReduction_30
happyReduction_30 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((Var happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_3  7 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn7
		 ([(Var happy_var_1, happy_var_3)]
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  8 happyReduction_32
happyReduction_32 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  8 happyReduction_33
happyReduction_33 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happyReduce 5 9 happyReduction_34
happyReduction_34 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_1,happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn9
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn10
		 (TInt
	)

happyReduce_37 = happySpecReduce_1  10 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn10
		 (TString
	)

happyReduce_38 = happySpecReduce_3  10 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TList happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  10 happyReduction_39
happyReduction_39 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TLam [] happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  10 happyReduction_40
happyReduction_40 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (TLam happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  11 happyReduction_41
happyReduction_41 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  11 happyReduction_42
happyReduction_42 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_42 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 44 44 notHappyAtAll (HappyState action) sts stk []

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
	TokenEquals -> cont 26;
	TokenVar happy_dollar_dollar -> cont 27;
	TokenString happy_dollar_dollar -> cont 28;
	TokenTInt -> cont 29;
	TokenTString -> cont 30;
	TokenDot -> cont 31;
	TokenComma -> cont 32;
	TokenColon -> cont 33;
	TokenSemiColon -> cont 34;
	TokenPO -> cont 35;
	TokenPC -> cont 36;
	TokenSBO -> cont 37;
	TokenSBC -> cont 38;
	TokenBO -> cont 39;
	TokenBC -> cont 40;
	TokenAO -> cont 41;
	TokenAC -> cont 42;
	TokenArrow -> cont 43;
	_ -> happyError' (tk:tks)
	}

happyError_ 44 tk tks = happyError' tks
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
