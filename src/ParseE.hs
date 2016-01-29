{-# OPTIONS_GHC -w #-}
module ParseE (parse) where

import Data.Monoid
import qualified Data.Map as M

import Lexer
import Lang
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

action_0 (11) = happyShift action_2
action_0 (12) = happyShift action_4
action_0 (13) = happyShift action_5
action_0 (14) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (17) = happyShift action_8
action_0 (19) = happyShift action_9
action_0 (25) = happyShift action_10
action_0 (26) = happyShift action_11
action_0 (33) = happyShift action_12
action_0 (35) = happyShift action_13
action_0 (37) = happyShift action_14
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (11) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (20) = happyShift action_29
action_3 (21) = happyShift action_30
action_3 (22) = happyShift action_31
action_3 (23) = happyShift action_32
action_3 (29) = happyShift action_33
action_3 (33) = happyShift action_34
action_3 (42) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 (11) = happyShift action_2
action_7 (12) = happyShift action_4
action_7 (13) = happyShift action_5
action_7 (14) = happyShift action_6
action_7 (15) = happyShift action_7
action_7 (17) = happyShift action_8
action_7 (19) = happyShift action_9
action_7 (25) = happyShift action_10
action_7 (26) = happyShift action_11
action_7 (33) = happyShift action_12
action_7 (35) = happyShift action_13
action_7 (37) = happyShift action_14
action_7 (4) = happyGoto action_28
action_7 _ = happyFail

action_8 (11) = happyShift action_2
action_8 (12) = happyShift action_4
action_8 (13) = happyShift action_5
action_8 (14) = happyShift action_6
action_8 (15) = happyShift action_7
action_8 (17) = happyShift action_8
action_8 (19) = happyShift action_9
action_8 (25) = happyShift action_10
action_8 (26) = happyShift action_11
action_8 (33) = happyShift action_12
action_8 (35) = happyShift action_13
action_8 (37) = happyShift action_14
action_8 (4) = happyGoto action_27
action_8 _ = happyFail

action_9 (39) = happyShift action_26
action_9 _ = happyFail

action_10 (24) = happyShift action_25
action_10 _ = happyReduce_5

action_11 _ = happyReduce_6

action_12 (11) = happyShift action_2
action_12 (12) = happyShift action_4
action_12 (13) = happyShift action_5
action_12 (14) = happyShift action_6
action_12 (15) = happyShift action_7
action_12 (17) = happyShift action_8
action_12 (19) = happyShift action_9
action_12 (25) = happyShift action_23
action_12 (26) = happyShift action_11
action_12 (33) = happyShift action_12
action_12 (34) = happyShift action_24
action_12 (35) = happyShift action_13
action_12 (37) = happyShift action_14
action_12 (4) = happyGoto action_21
action_12 (6) = happyGoto action_22
action_12 _ = happyFail

action_13 (11) = happyShift action_2
action_13 (12) = happyShift action_4
action_13 (13) = happyShift action_5
action_13 (14) = happyShift action_6
action_13 (15) = happyShift action_7
action_13 (17) = happyShift action_8
action_13 (19) = happyShift action_9
action_13 (25) = happyShift action_10
action_13 (26) = happyShift action_11
action_13 (31) = happyShift action_20
action_13 (33) = happyShift action_12
action_13 (35) = happyShift action_13
action_13 (37) = happyShift action_14
action_13 (4) = happyGoto action_18
action_13 (5) = happyGoto action_19
action_13 _ = happyFail

action_14 (25) = happyShift action_16
action_14 (38) = happyShift action_17
action_14 (8) = happyGoto action_15
action_14 _ = happyFail

action_15 (38) = happyShift action_60
action_15 _ = happyFail

action_16 (31) = happyShift action_59
action_16 _ = happyFail

action_17 _ = happyReduce_13

action_18 (20) = happyShift action_29
action_18 (21) = happyShift action_30
action_18 (22) = happyShift action_31
action_18 (23) = happyShift action_32
action_18 (29) = happyShift action_33
action_18 (30) = happyShift action_58
action_18 (33) = happyShift action_34
action_18 _ = happyReduce_26

action_19 (31) = happyShift action_57
action_19 _ = happyFail

action_20 (27) = happyShift action_53
action_20 (28) = happyShift action_54
action_20 (35) = happyShift action_55
action_20 (41) = happyShift action_56
action_20 (9) = happyGoto action_51
action_20 (10) = happyGoto action_52
action_20 _ = happyFail

action_21 (20) = happyShift action_29
action_21 (21) = happyShift action_30
action_21 (22) = happyShift action_31
action_21 (23) = happyShift action_32
action_21 (29) = happyShift action_33
action_21 (33) = happyShift action_34
action_21 (34) = happyShift action_50
action_21 _ = happyFail

action_22 (34) = happyShift action_49
action_22 _ = happyFail

action_23 (24) = happyShift action_25
action_23 (31) = happyShift action_48
action_23 _ = happyReduce_5

action_24 (37) = happyShift action_47
action_24 _ = happyFail

action_25 (11) = happyShift action_2
action_25 (12) = happyShift action_4
action_25 (13) = happyShift action_5
action_25 (14) = happyShift action_6
action_25 (15) = happyShift action_7
action_25 (17) = happyShift action_8
action_25 (19) = happyShift action_9
action_25 (25) = happyShift action_10
action_25 (26) = happyShift action_11
action_25 (33) = happyShift action_12
action_25 (35) = happyShift action_13
action_25 (37) = happyShift action_14
action_25 (4) = happyGoto action_46
action_25 _ = happyFail

action_26 (25) = happyShift action_45
action_26 _ = happyFail

action_27 (20) = happyShift action_29
action_27 (21) = happyShift action_30
action_27 (22) = happyShift action_31
action_27 (23) = happyShift action_32
action_27 (29) = happyShift action_33
action_27 (33) = happyShift action_34
action_27 (37) = happyShift action_44
action_27 _ = happyFail

action_28 (20) = happyShift action_29
action_28 (21) = happyShift action_30
action_28 (22) = happyShift action_31
action_28 (23) = happyShift action_32
action_28 (29) = happyShift action_33
action_28 (33) = happyShift action_34
action_28 (37) = happyShift action_43
action_28 _ = happyFail

action_29 (11) = happyShift action_2
action_29 (12) = happyShift action_4
action_29 (13) = happyShift action_5
action_29 (14) = happyShift action_6
action_29 (15) = happyShift action_7
action_29 (17) = happyShift action_8
action_29 (19) = happyShift action_9
action_29 (25) = happyShift action_10
action_29 (26) = happyShift action_11
action_29 (33) = happyShift action_12
action_29 (35) = happyShift action_13
action_29 (37) = happyShift action_14
action_29 (4) = happyGoto action_42
action_29 _ = happyFail

action_30 (11) = happyShift action_2
action_30 (12) = happyShift action_4
action_30 (13) = happyShift action_5
action_30 (14) = happyShift action_6
action_30 (15) = happyShift action_7
action_30 (17) = happyShift action_8
action_30 (19) = happyShift action_9
action_30 (25) = happyShift action_10
action_30 (26) = happyShift action_11
action_30 (33) = happyShift action_12
action_30 (35) = happyShift action_13
action_30 (37) = happyShift action_14
action_30 (4) = happyGoto action_41
action_30 _ = happyFail

action_31 (11) = happyShift action_2
action_31 (12) = happyShift action_4
action_31 (13) = happyShift action_5
action_31 (14) = happyShift action_6
action_31 (15) = happyShift action_7
action_31 (17) = happyShift action_8
action_31 (19) = happyShift action_9
action_31 (25) = happyShift action_10
action_31 (26) = happyShift action_11
action_31 (33) = happyShift action_12
action_31 (35) = happyShift action_13
action_31 (37) = happyShift action_14
action_31 (4) = happyGoto action_40
action_31 _ = happyFail

action_32 (11) = happyShift action_2
action_32 (12) = happyShift action_4
action_32 (13) = happyShift action_5
action_32 (14) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (17) = happyShift action_8
action_32 (19) = happyShift action_9
action_32 (25) = happyShift action_10
action_32 (26) = happyShift action_11
action_32 (33) = happyShift action_12
action_32 (35) = happyShift action_13
action_32 (37) = happyShift action_14
action_32 (4) = happyGoto action_39
action_32 _ = happyFail

action_33 (25) = happyShift action_38
action_33 _ = happyFail

action_34 (11) = happyShift action_2
action_34 (12) = happyShift action_4
action_34 (13) = happyShift action_5
action_34 (14) = happyShift action_6
action_34 (15) = happyShift action_7
action_34 (17) = happyShift action_8
action_34 (19) = happyShift action_9
action_34 (25) = happyShift action_10
action_34 (26) = happyShift action_11
action_34 (33) = happyShift action_12
action_34 (34) = happyShift action_37
action_34 (35) = happyShift action_13
action_34 (37) = happyShift action_14
action_34 (4) = happyGoto action_35
action_34 (7) = happyGoto action_36
action_34 _ = happyFail

action_35 (20) = happyShift action_29
action_35 (21) = happyShift action_30
action_35 (22) = happyShift action_31
action_35 (23) = happyShift action_32
action_35 (29) = happyShift action_33
action_35 (30) = happyShift action_77
action_35 (33) = happyShift action_34
action_35 _ = happyReduce_30

action_36 (34) = happyShift action_76
action_36 _ = happyFail

action_37 _ = happyReduce_11

action_38 _ = happyReduce_17

action_39 (29) = happyShift action_33
action_39 (33) = happyShift action_34
action_39 _ = happyReduce_22

action_40 (21) = happyShift action_30
action_40 (23) = happyShift action_32
action_40 (29) = happyShift action_33
action_40 (33) = happyShift action_34
action_40 _ = happyReduce_20

action_41 (29) = happyShift action_33
action_41 (33) = happyShift action_34
action_41 _ = happyReduce_21

action_42 (21) = happyShift action_30
action_42 (23) = happyShift action_32
action_42 (29) = happyShift action_33
action_42 (33) = happyShift action_34
action_42 _ = happyReduce_19

action_43 (11) = happyShift action_2
action_43 (12) = happyShift action_4
action_43 (13) = happyShift action_5
action_43 (14) = happyShift action_6
action_43 (15) = happyShift action_7
action_43 (17) = happyShift action_8
action_43 (19) = happyShift action_9
action_43 (25) = happyShift action_10
action_43 (26) = happyShift action_11
action_43 (33) = happyShift action_12
action_43 (35) = happyShift action_13
action_43 (37) = happyShift action_14
action_43 (4) = happyGoto action_75
action_43 _ = happyFail

action_44 (11) = happyShift action_2
action_44 (12) = happyShift action_4
action_44 (13) = happyShift action_5
action_44 (14) = happyShift action_6
action_44 (15) = happyShift action_7
action_44 (17) = happyShift action_8
action_44 (19) = happyShift action_9
action_44 (25) = happyShift action_10
action_44 (26) = happyShift action_11
action_44 (33) = happyShift action_12
action_44 (35) = happyShift action_13
action_44 (37) = happyShift action_14
action_44 (4) = happyGoto action_74
action_44 _ = happyFail

action_45 (32) = happyShift action_73
action_45 _ = happyFail

action_46 (18) = happyShift action_72
action_46 (20) = happyShift action_29
action_46 (21) = happyShift action_30
action_46 (22) = happyShift action_31
action_46 (23) = happyShift action_32
action_46 (29) = happyShift action_33
action_46 (33) = happyShift action_34
action_46 _ = happyFail

action_47 (11) = happyShift action_2
action_47 (12) = happyShift action_4
action_47 (13) = happyShift action_5
action_47 (14) = happyShift action_6
action_47 (15) = happyShift action_7
action_47 (17) = happyShift action_8
action_47 (19) = happyShift action_9
action_47 (25) = happyShift action_10
action_47 (26) = happyShift action_11
action_47 (33) = happyShift action_12
action_47 (35) = happyShift action_13
action_47 (37) = happyShift action_14
action_47 (4) = happyGoto action_71
action_47 _ = happyFail

action_48 (27) = happyShift action_53
action_48 (28) = happyShift action_54
action_48 (35) = happyShift action_55
action_48 (41) = happyShift action_56
action_48 (9) = happyGoto action_70
action_48 (10) = happyGoto action_52
action_48 _ = happyFail

action_49 (37) = happyShift action_69
action_49 _ = happyFail

action_50 _ = happyReduce_23

action_51 (30) = happyShift action_67
action_51 (36) = happyShift action_68
action_51 _ = happyReduce_39

action_52 (41) = happyShift action_66
action_52 _ = happyFail

action_53 _ = happyReduce_33

action_54 _ = happyReduce_34

action_55 (27) = happyShift action_53
action_55 (28) = happyShift action_54
action_55 (35) = happyShift action_55
action_55 (41) = happyShift action_56
action_55 (9) = happyGoto action_65
action_55 (10) = happyGoto action_52
action_55 _ = happyFail

action_56 (27) = happyShift action_53
action_56 (28) = happyShift action_54
action_56 (35) = happyShift action_55
action_56 (41) = happyShift action_56
action_56 (9) = happyGoto action_64
action_56 (10) = happyGoto action_52
action_56 _ = happyFail

action_57 (27) = happyShift action_53
action_57 (28) = happyShift action_54
action_57 (35) = happyShift action_55
action_57 (41) = happyShift action_56
action_57 (9) = happyGoto action_63
action_57 (10) = happyGoto action_52
action_57 _ = happyFail

action_58 (11) = happyShift action_2
action_58 (12) = happyShift action_4
action_58 (13) = happyShift action_5
action_58 (14) = happyShift action_6
action_58 (15) = happyShift action_7
action_58 (17) = happyShift action_8
action_58 (19) = happyShift action_9
action_58 (25) = happyShift action_10
action_58 (26) = happyShift action_11
action_58 (33) = happyShift action_12
action_58 (35) = happyShift action_13
action_58 (37) = happyShift action_14
action_58 (4) = happyGoto action_18
action_58 (5) = happyGoto action_62
action_58 _ = happyFail

action_59 (11) = happyShift action_2
action_59 (12) = happyShift action_4
action_59 (13) = happyShift action_5
action_59 (14) = happyShift action_6
action_59 (15) = happyShift action_7
action_59 (17) = happyShift action_8
action_59 (19) = happyShift action_9
action_59 (25) = happyShift action_10
action_59 (26) = happyShift action_11
action_59 (33) = happyShift action_12
action_59 (35) = happyShift action_13
action_59 (37) = happyShift action_14
action_59 (4) = happyGoto action_61
action_59 _ = happyFail

action_60 _ = happyReduce_14

action_61 (20) = happyShift action_29
action_61 (21) = happyShift action_30
action_61 (22) = happyShift action_31
action_61 (23) = happyShift action_32
action_61 (29) = happyShift action_33
action_61 (30) = happyShift action_91
action_61 (33) = happyShift action_34
action_61 _ = happyReduce_32

action_62 _ = happyReduce_25

action_63 (30) = happyShift action_67
action_63 (36) = happyShift action_90
action_63 _ = happyReduce_39

action_64 (30) = happyShift action_67
action_64 (41) = happyReduce_39
action_64 _ = happyReduce_36

action_65 (30) = happyShift action_67
action_65 (36) = happyShift action_89
action_65 _ = happyReduce_39

action_66 (27) = happyShift action_53
action_66 (28) = happyShift action_54
action_66 (35) = happyShift action_55
action_66 (41) = happyShift action_56
action_66 (9) = happyGoto action_88
action_66 (10) = happyGoto action_52
action_66 _ = happyFail

action_67 (27) = happyShift action_53
action_67 (28) = happyShift action_54
action_67 (35) = happyShift action_55
action_67 (41) = happyShift action_56
action_67 (9) = happyGoto action_86
action_67 (10) = happyGoto action_87
action_67 _ = happyFail

action_68 _ = happyReduce_7

action_69 (11) = happyShift action_2
action_69 (12) = happyShift action_4
action_69 (13) = happyShift action_5
action_69 (14) = happyShift action_6
action_69 (15) = happyShift action_7
action_69 (17) = happyShift action_8
action_69 (19) = happyShift action_9
action_69 (25) = happyShift action_10
action_69 (26) = happyShift action_11
action_69 (33) = happyShift action_12
action_69 (35) = happyShift action_13
action_69 (37) = happyShift action_14
action_69 (4) = happyGoto action_85
action_69 _ = happyFail

action_70 (30) = happyShift action_84
action_70 (41) = happyReduce_39
action_70 _ = happyReduce_28

action_71 (20) = happyShift action_29
action_71 (21) = happyShift action_30
action_71 (22) = happyShift action_31
action_71 (23) = happyShift action_32
action_71 (29) = happyShift action_33
action_71 (33) = happyShift action_34
action_71 (38) = happyShift action_83
action_71 _ = happyFail

action_72 (11) = happyShift action_2
action_72 (12) = happyShift action_4
action_72 (13) = happyShift action_5
action_72 (14) = happyShift action_6
action_72 (15) = happyShift action_7
action_72 (17) = happyShift action_8
action_72 (19) = happyShift action_9
action_72 (25) = happyShift action_10
action_72 (26) = happyShift action_11
action_72 (33) = happyShift action_12
action_72 (35) = happyShift action_13
action_72 (37) = happyShift action_14
action_72 (4) = happyGoto action_82
action_72 _ = happyFail

action_73 (27) = happyShift action_53
action_73 (28) = happyShift action_54
action_73 (35) = happyShift action_55
action_73 (41) = happyShift action_56
action_73 (9) = happyGoto action_81
action_73 (10) = happyGoto action_52
action_73 _ = happyFail

action_74 (20) = happyShift action_29
action_74 (21) = happyShift action_30
action_74 (22) = happyShift action_31
action_74 (23) = happyShift action_32
action_74 (29) = happyShift action_33
action_74 (33) = happyShift action_34
action_74 (38) = happyShift action_80
action_74 _ = happyFail

action_75 (20) = happyShift action_29
action_75 (21) = happyShift action_30
action_75 (22) = happyShift action_31
action_75 (23) = happyShift action_32
action_75 (29) = happyShift action_33
action_75 (33) = happyShift action_34
action_75 (38) = happyShift action_79
action_75 _ = happyFail

action_76 _ = happyReduce_12

action_77 (11) = happyShift action_2
action_77 (12) = happyShift action_4
action_77 (13) = happyShift action_5
action_77 (14) = happyShift action_6
action_77 (15) = happyShift action_7
action_77 (17) = happyShift action_8
action_77 (19) = happyShift action_9
action_77 (25) = happyShift action_10
action_77 (26) = happyShift action_11
action_77 (33) = happyShift action_12
action_77 (35) = happyShift action_13
action_77 (37) = happyShift action_14
action_77 (4) = happyGoto action_35
action_77 (7) = happyGoto action_78
action_77 _ = happyFail

action_78 _ = happyReduce_29

action_79 (16) = happyShift action_98
action_79 _ = happyFail

action_80 (33) = happyShift action_97
action_80 _ = happyFail

action_81 (30) = happyShift action_67
action_81 (32) = happyShift action_96
action_81 _ = happyReduce_39

action_82 (20) = happyShift action_29
action_82 (21) = happyShift action_30
action_82 (22) = happyShift action_31
action_82 (23) = happyShift action_32
action_82 (29) = happyShift action_33
action_82 (33) = happyShift action_34
action_82 _ = happyReduce_18

action_83 _ = happyReduce_9

action_84 (25) = happyShift action_95
action_84 (27) = happyShift action_53
action_84 (28) = happyShift action_54
action_84 (35) = happyShift action_55
action_84 (41) = happyShift action_56
action_84 (6) = happyGoto action_94
action_84 (9) = happyGoto action_86
action_84 (10) = happyGoto action_87
action_84 _ = happyFail

action_85 (20) = happyShift action_29
action_85 (21) = happyShift action_30
action_85 (22) = happyShift action_31
action_85 (23) = happyShift action_32
action_85 (29) = happyShift action_33
action_85 (33) = happyShift action_34
action_85 (38) = happyShift action_93
action_85 _ = happyFail

action_86 (30) = happyShift action_67
action_86 _ = happyReduce_39

action_87 (41) = happyShift action_66
action_87 _ = happyFail

action_88 (30) = happyShift action_67
action_88 (41) = happyReduce_39
action_88 _ = happyReduce_37

action_89 _ = happyReduce_35

action_90 _ = happyReduce_8

action_91 (25) = happyShift action_16
action_91 (8) = happyGoto action_92
action_91 _ = happyFail

action_92 _ = happyReduce_31

action_93 _ = happyReduce_10

action_94 _ = happyReduce_27

action_95 (31) = happyShift action_48
action_95 _ = happyFail

action_96 (11) = happyShift action_2
action_96 (12) = happyShift action_4
action_96 (13) = happyShift action_5
action_96 (14) = happyShift action_6
action_96 (15) = happyShift action_7
action_96 (17) = happyShift action_8
action_96 (19) = happyShift action_9
action_96 (25) = happyShift action_10
action_96 (26) = happyShift action_11
action_96 (33) = happyShift action_12
action_96 (35) = happyShift action_13
action_96 (37) = happyShift action_14
action_96 (4) = happyGoto action_101
action_96 _ = happyFail

action_97 (25) = happyShift action_100
action_97 _ = happyFail

action_98 (37) = happyShift action_99
action_98 _ = happyFail

action_99 (11) = happyShift action_2
action_99 (12) = happyShift action_4
action_99 (13) = happyShift action_5
action_99 (14) = happyShift action_6
action_99 (15) = happyShift action_7
action_99 (17) = happyShift action_8
action_99 (19) = happyShift action_9
action_99 (25) = happyShift action_10
action_99 (26) = happyShift action_11
action_99 (33) = happyShift action_12
action_99 (35) = happyShift action_13
action_99 (37) = happyShift action_14
action_99 (4) = happyGoto action_104
action_99 _ = happyFail

action_100 (25) = happyShift action_103
action_100 _ = happyFail

action_101 (20) = happyShift action_29
action_101 (21) = happyShift action_30
action_101 (22) = happyShift action_31
action_101 (23) = happyShift action_32
action_101 (29) = happyShift action_33
action_101 (33) = happyShift action_34
action_101 (40) = happyShift action_102
action_101 _ = happyFail

action_102 _ = happyReduce_24

action_103 (34) = happyShift action_106
action_103 _ = happyFail

action_104 (20) = happyShift action_29
action_104 (21) = happyShift action_30
action_104 (22) = happyShift action_31
action_104 (23) = happyShift action_32
action_104 (29) = happyShift action_33
action_104 (33) = happyShift action_34
action_104 (38) = happyShift action_105
action_104 _ = happyFail

action_105 _ = happyReduce_15

action_106 (37) = happyShift action_107
action_106 _ = happyFail

action_107 (11) = happyShift action_2
action_107 (12) = happyShift action_4
action_107 (13) = happyShift action_5
action_107 (14) = happyShift action_6
action_107 (15) = happyShift action_7
action_107 (17) = happyShift action_8
action_107 (19) = happyShift action_9
action_107 (25) = happyShift action_10
action_107 (26) = happyShift action_11
action_107 (33) = happyShift action_12
action_107 (35) = happyShift action_13
action_107 (37) = happyShift action_14
action_107 (4) = happyGoto action_108
action_107 _ = happyFail

action_108 (20) = happyShift action_29
action_108 (21) = happyShift action_30
action_108 (22) = happyShift action_31
action_108 (23) = happyShift action_32
action_108 (29) = happyShift action_33
action_108 (33) = happyShift action_34
action_108 (38) = happyShift action_109
action_108 _ = happyFail

action_109 _ = happyReduce_16

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
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EList happy_var_3 []
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 5 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
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
	(HappyAbsSyn6  happy_var_2) `HappyStk`
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
	(HappyAbsSyn7  happy_var_3) `HappyStk`
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
	(HappyAbsSyn8  happy_var_2)
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

happyReduce_18 = happyReduce 5 4 happyReduction_18
happyReduction_18 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELet (Var happy_var_1) happy_var_3 happy_var_5
	) `HappyStk` happyRest

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
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ESource (ES (Id happy_var_3) happy_var_5) happy_var_7
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  5 happyReduction_25
happyReduction_25 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  5 happyReduction_26
happyReduction_26 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happyReduce 5 6 happyReduction_27
happyReduction_27 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((Var happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_3  6 happyReduction_28
happyReduction_28 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 ([(Var happy_var_1, happy_var_3)]
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  7 happyReduction_30
happyReduction_30 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happyReduce 5 8 happyReduction_31
happyReduction_31 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_1,happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  8 happyReduction_32
happyReduction_32 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn8
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  9 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_34 = happySpecReduce_1  9 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn9
		 (TString
	)

happyReduce_35 = happySpecReduce_3  9 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TList happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  9 happyReduction_36
happyReduction_36 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TLam [] happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  9 happyReduction_37
happyReduction_37 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (TLam happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  10 happyReduction_38
happyReduction_38 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  10 happyReduction_39
happyReduction_39 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_39 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 42 42 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 11;
	TokenDouble happy_dollar_dollar -> cont 12;
	TokenTrue -> cont 13;
	TokenFalse -> cont 14;
	TokenIf -> cont 15;
	TokenElse -> cont 16;
	TokenCase -> cont 17;
	TokenIn -> cont 18;
	TokenSource -> cont 19;
	TokenPlus -> cont 20;
	TokenTimes -> cont 21;
	TokenMinus -> cont 22;
	TokenDivide -> cont 23;
	TokenEqual -> cont 24;
	TokenVar happy_dollar_dollar -> cont 25;
	TokenString happy_dollar_dollar -> cont 26;
	TokenTInt -> cont 27;
	TokenTString -> cont 28;
	TokenDot -> cont 29;
	TokenComma -> cont 30;
	TokenColon -> cont 31;
	TokenSemiColon -> cont 32;
	TokenPO -> cont 33;
	TokenPC -> cont 34;
	TokenSBO -> cont 35;
	TokenSBC -> cont 36;
	TokenBO -> cont 37;
	TokenBC -> cont 38;
	TokenAO -> cont 39;
	TokenAC -> cont 40;
	TokenArrow -> cont 41;
	_ -> happyError' (tk:tks)
	}

happyError_ 42 tk tks = happyError' tks
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
