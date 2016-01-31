{-# OPTIONS_GHC -w #-}
module Grammar (parse) where

import Data.Monoid
import qualified Data.Map as M

import Lexer
import Lang
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
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
	| HappyAbsSyn12 t12

action_0 (13) = happyShift action_2
action_0 (14) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (16) = happyShift action_7
action_0 (17) = happyShift action_8
action_0 (19) = happyShift action_9
action_0 (21) = happyShift action_10
action_0 (28) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (38) = happyShift action_13
action_0 (40) = happyShift action_14
action_0 (42) = happyShift action_15
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail

action_1 (13) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (22) = happyShift action_30
action_3 (23) = happyShift action_31
action_3 (24) = happyShift action_32
action_3 (25) = happyShift action_33
action_3 (27) = happyShift action_34
action_3 (34) = happyShift action_35
action_3 (38) = happyShift action_36
action_3 (47) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_18

action_5 _ = happyReduce_2

action_6 _ = happyReduce_3

action_7 _ = happyReduce_4

action_8 (13) = happyShift action_2
action_8 (14) = happyShift action_5
action_8 (15) = happyShift action_6
action_8 (16) = happyShift action_7
action_8 (17) = happyShift action_8
action_8 (19) = happyShift action_9
action_8 (21) = happyShift action_10
action_8 (28) = happyShift action_11
action_8 (29) = happyShift action_12
action_8 (38) = happyShift action_13
action_8 (40) = happyShift action_14
action_8 (42) = happyShift action_15
action_8 (4) = happyGoto action_29
action_8 (5) = happyGoto action_4
action_8 _ = happyFail

action_9 (13) = happyShift action_2
action_9 (14) = happyShift action_5
action_9 (15) = happyShift action_6
action_9 (16) = happyShift action_7
action_9 (17) = happyShift action_8
action_9 (19) = happyShift action_9
action_9 (21) = happyShift action_10
action_9 (28) = happyShift action_11
action_9 (29) = happyShift action_12
action_9 (38) = happyShift action_13
action_9 (40) = happyShift action_14
action_9 (42) = happyShift action_15
action_9 (4) = happyGoto action_28
action_9 (5) = happyGoto action_4
action_9 _ = happyFail

action_10 (44) = happyShift action_27
action_10 _ = happyFail

action_11 (26) = happyShift action_26
action_11 _ = happyReduce_5

action_12 _ = happyReduce_6

action_13 (13) = happyShift action_2
action_13 (14) = happyShift action_5
action_13 (15) = happyShift action_6
action_13 (16) = happyShift action_7
action_13 (17) = happyShift action_8
action_13 (19) = happyShift action_9
action_13 (21) = happyShift action_10
action_13 (28) = happyShift action_24
action_13 (29) = happyShift action_12
action_13 (38) = happyShift action_13
action_13 (39) = happyShift action_25
action_13 (40) = happyShift action_14
action_13 (42) = happyShift action_15
action_13 (4) = happyGoto action_22
action_13 (5) = happyGoto action_4
action_13 (7) = happyGoto action_23
action_13 _ = happyFail

action_14 (13) = happyShift action_2
action_14 (14) = happyShift action_5
action_14 (15) = happyShift action_6
action_14 (16) = happyShift action_7
action_14 (17) = happyShift action_8
action_14 (19) = happyShift action_9
action_14 (21) = happyShift action_10
action_14 (28) = happyShift action_11
action_14 (29) = happyShift action_12
action_14 (36) = happyShift action_21
action_14 (38) = happyShift action_13
action_14 (40) = happyShift action_14
action_14 (42) = happyShift action_15
action_14 (4) = happyGoto action_19
action_14 (5) = happyGoto action_4
action_14 (6) = happyGoto action_20
action_14 _ = happyFail

action_15 (28) = happyShift action_17
action_15 (43) = happyShift action_18
action_15 (9) = happyGoto action_16
action_15 _ = happyFail

action_16 (43) = happyShift action_66
action_16 _ = happyFail

action_17 (36) = happyShift action_65
action_17 _ = happyFail

action_18 _ = happyReduce_13

action_19 (22) = happyShift action_30
action_19 (23) = happyShift action_31
action_19 (24) = happyShift action_32
action_19 (25) = happyShift action_33
action_19 (27) = happyShift action_34
action_19 (34) = happyShift action_35
action_19 (35) = happyShift action_64
action_19 (38) = happyShift action_36
action_19 _ = happyReduce_29

action_20 (36) = happyShift action_63
action_20 _ = happyFail

action_21 (30) = happyShift action_56
action_21 (31) = happyShift action_57
action_21 (32) = happyShift action_58
action_21 (33) = happyShift action_59
action_21 (40) = happyShift action_60
action_21 (42) = happyShift action_61
action_21 (46) = happyShift action_62
action_21 (10) = happyGoto action_54
action_21 (12) = happyGoto action_55
action_21 _ = happyFail

action_22 (22) = happyShift action_30
action_22 (23) = happyShift action_31
action_22 (24) = happyShift action_32
action_22 (25) = happyShift action_33
action_22 (27) = happyShift action_34
action_22 (34) = happyShift action_35
action_22 (38) = happyShift action_36
action_22 (39) = happyShift action_53
action_22 _ = happyFail

action_23 (39) = happyShift action_52
action_23 _ = happyFail

action_24 (26) = happyShift action_26
action_24 (36) = happyShift action_51
action_24 _ = happyReduce_5

action_25 (36) = happyShift action_50
action_25 _ = happyFail

action_26 (13) = happyShift action_2
action_26 (14) = happyShift action_5
action_26 (15) = happyShift action_6
action_26 (16) = happyShift action_7
action_26 (17) = happyShift action_8
action_26 (19) = happyShift action_9
action_26 (21) = happyShift action_10
action_26 (28) = happyShift action_11
action_26 (29) = happyShift action_12
action_26 (38) = happyShift action_13
action_26 (40) = happyShift action_14
action_26 (42) = happyShift action_15
action_26 (4) = happyGoto action_49
action_26 (5) = happyGoto action_4
action_26 _ = happyFail

action_27 (28) = happyShift action_48
action_27 _ = happyFail

action_28 (22) = happyShift action_30
action_28 (23) = happyShift action_31
action_28 (24) = happyShift action_32
action_28 (25) = happyShift action_33
action_28 (27) = happyShift action_34
action_28 (34) = happyShift action_35
action_28 (38) = happyShift action_36
action_28 (42) = happyShift action_47
action_28 _ = happyFail

action_29 (22) = happyShift action_30
action_29 (23) = happyShift action_31
action_29 (24) = happyShift action_32
action_29 (25) = happyShift action_33
action_29 (27) = happyShift action_34
action_29 (34) = happyShift action_35
action_29 (38) = happyShift action_36
action_29 (42) = happyShift action_46
action_29 _ = happyFail

action_30 (13) = happyShift action_2
action_30 (14) = happyShift action_5
action_30 (15) = happyShift action_6
action_30 (16) = happyShift action_7
action_30 (17) = happyShift action_8
action_30 (19) = happyShift action_9
action_30 (21) = happyShift action_10
action_30 (28) = happyShift action_11
action_30 (29) = happyShift action_12
action_30 (38) = happyShift action_13
action_30 (40) = happyShift action_14
action_30 (42) = happyShift action_15
action_30 (4) = happyGoto action_45
action_30 (5) = happyGoto action_4
action_30 _ = happyFail

action_31 (13) = happyShift action_2
action_31 (14) = happyShift action_5
action_31 (15) = happyShift action_6
action_31 (16) = happyShift action_7
action_31 (17) = happyShift action_8
action_31 (19) = happyShift action_9
action_31 (21) = happyShift action_10
action_31 (28) = happyShift action_11
action_31 (29) = happyShift action_12
action_31 (38) = happyShift action_13
action_31 (40) = happyShift action_14
action_31 (42) = happyShift action_15
action_31 (4) = happyGoto action_44
action_31 (5) = happyGoto action_4
action_31 _ = happyFail

action_32 (13) = happyShift action_2
action_32 (14) = happyShift action_5
action_32 (15) = happyShift action_6
action_32 (16) = happyShift action_7
action_32 (17) = happyShift action_8
action_32 (19) = happyShift action_9
action_32 (21) = happyShift action_10
action_32 (28) = happyShift action_11
action_32 (29) = happyShift action_12
action_32 (38) = happyShift action_13
action_32 (40) = happyShift action_14
action_32 (42) = happyShift action_15
action_32 (4) = happyGoto action_43
action_32 (5) = happyGoto action_4
action_32 _ = happyFail

action_33 (13) = happyShift action_2
action_33 (14) = happyShift action_5
action_33 (15) = happyShift action_6
action_33 (16) = happyShift action_7
action_33 (17) = happyShift action_8
action_33 (19) = happyShift action_9
action_33 (21) = happyShift action_10
action_33 (28) = happyShift action_11
action_33 (29) = happyShift action_12
action_33 (38) = happyShift action_13
action_33 (40) = happyShift action_14
action_33 (42) = happyShift action_15
action_33 (4) = happyGoto action_42
action_33 (5) = happyGoto action_4
action_33 _ = happyFail

action_34 (13) = happyShift action_2
action_34 (14) = happyShift action_5
action_34 (15) = happyShift action_6
action_34 (16) = happyShift action_7
action_34 (17) = happyShift action_8
action_34 (19) = happyShift action_9
action_34 (21) = happyShift action_10
action_34 (28) = happyShift action_11
action_34 (29) = happyShift action_12
action_34 (38) = happyShift action_13
action_34 (40) = happyShift action_14
action_34 (42) = happyShift action_15
action_34 (4) = happyGoto action_41
action_34 (5) = happyGoto action_4
action_34 _ = happyFail

action_35 (28) = happyShift action_40
action_35 _ = happyFail

action_36 (13) = happyShift action_2
action_36 (14) = happyShift action_5
action_36 (15) = happyShift action_6
action_36 (16) = happyShift action_7
action_36 (17) = happyShift action_8
action_36 (19) = happyShift action_9
action_36 (21) = happyShift action_10
action_36 (28) = happyShift action_11
action_36 (29) = happyShift action_12
action_36 (38) = happyShift action_13
action_36 (39) = happyShift action_39
action_36 (40) = happyShift action_14
action_36 (42) = happyShift action_15
action_36 (4) = happyGoto action_37
action_36 (5) = happyGoto action_4
action_36 (8) = happyGoto action_38
action_36 _ = happyFail

action_37 (22) = happyShift action_30
action_37 (23) = happyShift action_31
action_37 (24) = happyShift action_32
action_37 (25) = happyShift action_33
action_37 (27) = happyShift action_34
action_37 (34) = happyShift action_35
action_37 (35) = happyShift action_88
action_37 (38) = happyShift action_36
action_37 _ = happyReduce_33

action_38 (39) = happyShift action_87
action_38 _ = happyFail

action_39 _ = happyReduce_11

action_40 _ = happyReduce_17

action_41 (22) = happyShift action_30
action_41 (23) = happyShift action_31
action_41 (24) = happyShift action_32
action_41 (25) = happyShift action_33
action_41 (34) = happyShift action_35
action_41 (38) = happyShift action_36
action_41 _ = happyReduce_19

action_42 (34) = happyShift action_35
action_42 (38) = happyShift action_36
action_42 _ = happyReduce_23

action_43 (23) = happyShift action_31
action_43 (25) = happyShift action_33
action_43 (34) = happyShift action_35
action_43 (38) = happyShift action_36
action_43 _ = happyReduce_21

action_44 (34) = happyShift action_35
action_44 (38) = happyShift action_36
action_44 _ = happyReduce_22

action_45 (23) = happyShift action_31
action_45 (25) = happyShift action_33
action_45 (34) = happyShift action_35
action_45 (38) = happyShift action_36
action_45 _ = happyReduce_20

action_46 (13) = happyShift action_2
action_46 (14) = happyShift action_5
action_46 (15) = happyShift action_6
action_46 (16) = happyShift action_7
action_46 (17) = happyShift action_8
action_46 (19) = happyShift action_9
action_46 (21) = happyShift action_10
action_46 (28) = happyShift action_11
action_46 (29) = happyShift action_12
action_46 (38) = happyShift action_13
action_46 (40) = happyShift action_14
action_46 (42) = happyShift action_15
action_46 (4) = happyGoto action_86
action_46 (5) = happyGoto action_4
action_46 _ = happyFail

action_47 (13) = happyShift action_2
action_47 (14) = happyShift action_5
action_47 (15) = happyShift action_6
action_47 (16) = happyShift action_7
action_47 (17) = happyShift action_8
action_47 (19) = happyShift action_9
action_47 (21) = happyShift action_10
action_47 (28) = happyShift action_11
action_47 (29) = happyShift action_12
action_47 (38) = happyShift action_13
action_47 (40) = happyShift action_14
action_47 (42) = happyShift action_15
action_47 (4) = happyGoto action_85
action_47 (5) = happyGoto action_4
action_47 _ = happyFail

action_48 (37) = happyShift action_84
action_48 _ = happyFail

action_49 (20) = happyShift action_82
action_49 (22) = happyShift action_30
action_49 (23) = happyShift action_31
action_49 (24) = happyShift action_32
action_49 (25) = happyShift action_33
action_49 (27) = happyShift action_34
action_49 (28) = happyShift action_83
action_49 (34) = happyShift action_35
action_49 (38) = happyShift action_36
action_49 (5) = happyGoto action_81
action_49 _ = happyFail

action_50 (30) = happyShift action_56
action_50 (31) = happyShift action_57
action_50 (32) = happyShift action_58
action_50 (33) = happyShift action_59
action_50 (40) = happyShift action_60
action_50 (42) = happyShift action_61
action_50 (46) = happyShift action_62
action_50 (10) = happyGoto action_80
action_50 (12) = happyGoto action_55
action_50 _ = happyFail

action_51 (30) = happyShift action_56
action_51 (31) = happyShift action_57
action_51 (32) = happyShift action_58
action_51 (33) = happyShift action_59
action_51 (40) = happyShift action_60
action_51 (42) = happyShift action_61
action_51 (46) = happyShift action_62
action_51 (10) = happyGoto action_79
action_51 (12) = happyGoto action_55
action_51 _ = happyFail

action_52 (36) = happyShift action_78
action_52 _ = happyFail

action_53 _ = happyReduce_24

action_54 (35) = happyShift action_76
action_54 (41) = happyShift action_77
action_54 _ = happyReduce_48

action_55 (46) = happyShift action_75
action_55 _ = happyFail

action_56 _ = happyReduce_36

action_57 _ = happyReduce_39

action_58 _ = happyReduce_38

action_59 _ = happyReduce_37

action_60 (30) = happyShift action_56
action_60 (31) = happyShift action_57
action_60 (32) = happyShift action_58
action_60 (33) = happyShift action_59
action_60 (40) = happyShift action_60
action_60 (42) = happyShift action_61
action_60 (46) = happyShift action_62
action_60 (10) = happyGoto action_74
action_60 (12) = happyGoto action_55
action_60 _ = happyFail

action_61 (28) = happyShift action_72
action_61 (43) = happyShift action_73
action_61 (11) = happyGoto action_71
action_61 _ = happyFail

action_62 (30) = happyShift action_56
action_62 (31) = happyShift action_57
action_62 (32) = happyShift action_58
action_62 (33) = happyShift action_59
action_62 (40) = happyShift action_60
action_62 (42) = happyShift action_61
action_62 (46) = happyShift action_62
action_62 (10) = happyGoto action_70
action_62 (12) = happyGoto action_55
action_62 _ = happyFail

action_63 (30) = happyShift action_56
action_63 (31) = happyShift action_57
action_63 (32) = happyShift action_58
action_63 (33) = happyShift action_59
action_63 (40) = happyShift action_60
action_63 (42) = happyShift action_61
action_63 (46) = happyShift action_62
action_63 (10) = happyGoto action_69
action_63 (12) = happyGoto action_55
action_63 _ = happyFail

action_64 (13) = happyShift action_2
action_64 (14) = happyShift action_5
action_64 (15) = happyShift action_6
action_64 (16) = happyShift action_7
action_64 (17) = happyShift action_8
action_64 (19) = happyShift action_9
action_64 (21) = happyShift action_10
action_64 (28) = happyShift action_11
action_64 (29) = happyShift action_12
action_64 (38) = happyShift action_13
action_64 (40) = happyShift action_14
action_64 (42) = happyShift action_15
action_64 (4) = happyGoto action_19
action_64 (5) = happyGoto action_4
action_64 (6) = happyGoto action_68
action_64 _ = happyFail

action_65 (13) = happyShift action_2
action_65 (14) = happyShift action_5
action_65 (15) = happyShift action_6
action_65 (16) = happyShift action_7
action_65 (17) = happyShift action_8
action_65 (19) = happyShift action_9
action_65 (21) = happyShift action_10
action_65 (28) = happyShift action_11
action_65 (29) = happyShift action_12
action_65 (38) = happyShift action_13
action_65 (40) = happyShift action_14
action_65 (42) = happyShift action_15
action_65 (4) = happyGoto action_67
action_65 (5) = happyGoto action_4
action_65 _ = happyFail

action_66 _ = happyReduce_14

action_67 (22) = happyShift action_30
action_67 (23) = happyShift action_31
action_67 (24) = happyShift action_32
action_67 (25) = happyShift action_33
action_67 (27) = happyShift action_34
action_67 (34) = happyShift action_35
action_67 (35) = happyShift action_104
action_67 (38) = happyShift action_36
action_67 _ = happyReduce_35

action_68 _ = happyReduce_28

action_69 (35) = happyShift action_76
action_69 (41) = happyShift action_103
action_69 _ = happyReduce_48

action_70 (35) = happyShift action_76
action_70 (46) = happyReduce_48
action_70 _ = happyReduce_41

action_71 (43) = happyShift action_102
action_71 _ = happyFail

action_72 (36) = happyShift action_101
action_72 _ = happyFail

action_73 _ = happyReduce_43

action_74 (35) = happyShift action_76
action_74 (41) = happyShift action_100
action_74 _ = happyReduce_48

action_75 (30) = happyShift action_56
action_75 (31) = happyShift action_57
action_75 (32) = happyShift action_58
action_75 (33) = happyShift action_59
action_75 (40) = happyShift action_60
action_75 (42) = happyShift action_61
action_75 (46) = happyShift action_62
action_75 (10) = happyGoto action_99
action_75 (12) = happyGoto action_55
action_75 _ = happyFail

action_76 (30) = happyShift action_56
action_76 (31) = happyShift action_57
action_76 (32) = happyShift action_58
action_76 (33) = happyShift action_59
action_76 (40) = happyShift action_60
action_76 (42) = happyShift action_61
action_76 (46) = happyShift action_62
action_76 (10) = happyGoto action_97
action_76 (12) = happyGoto action_98
action_76 _ = happyFail

action_77 _ = happyReduce_7

action_78 (30) = happyShift action_56
action_78 (31) = happyShift action_57
action_78 (32) = happyShift action_58
action_78 (33) = happyShift action_59
action_78 (40) = happyShift action_60
action_78 (42) = happyShift action_61
action_78 (46) = happyShift action_62
action_78 (10) = happyGoto action_96
action_78 (12) = happyGoto action_55
action_78 _ = happyFail

action_79 (35) = happyShift action_95
action_79 (46) = happyReduce_48
action_79 _ = happyReduce_31

action_80 (35) = happyShift action_76
action_80 (42) = happyShift action_94
action_80 _ = happyReduce_48

action_81 _ = happyReduce_26

action_82 (13) = happyShift action_2
action_82 (14) = happyShift action_5
action_82 (15) = happyShift action_6
action_82 (16) = happyShift action_7
action_82 (17) = happyShift action_8
action_82 (19) = happyShift action_9
action_82 (21) = happyShift action_10
action_82 (28) = happyShift action_11
action_82 (29) = happyShift action_12
action_82 (38) = happyShift action_13
action_82 (40) = happyShift action_14
action_82 (42) = happyShift action_15
action_82 (4) = happyGoto action_93
action_82 (5) = happyGoto action_4
action_82 _ = happyFail

action_83 (26) = happyShift action_26
action_83 _ = happyFail

action_84 (30) = happyShift action_56
action_84 (31) = happyShift action_57
action_84 (32) = happyShift action_58
action_84 (33) = happyShift action_59
action_84 (40) = happyShift action_60
action_84 (42) = happyShift action_61
action_84 (46) = happyShift action_62
action_84 (10) = happyGoto action_92
action_84 (12) = happyGoto action_55
action_84 _ = happyFail

action_85 (22) = happyShift action_30
action_85 (23) = happyShift action_31
action_85 (24) = happyShift action_32
action_85 (25) = happyShift action_33
action_85 (27) = happyShift action_34
action_85 (34) = happyShift action_35
action_85 (38) = happyShift action_36
action_85 (43) = happyShift action_91
action_85 _ = happyFail

action_86 (22) = happyShift action_30
action_86 (23) = happyShift action_31
action_86 (24) = happyShift action_32
action_86 (25) = happyShift action_33
action_86 (27) = happyShift action_34
action_86 (34) = happyShift action_35
action_86 (38) = happyShift action_36
action_86 (43) = happyShift action_90
action_86 _ = happyFail

action_87 _ = happyReduce_12

action_88 (13) = happyShift action_2
action_88 (14) = happyShift action_5
action_88 (15) = happyShift action_6
action_88 (16) = happyShift action_7
action_88 (17) = happyShift action_8
action_88 (19) = happyShift action_9
action_88 (21) = happyShift action_10
action_88 (28) = happyShift action_11
action_88 (29) = happyShift action_12
action_88 (38) = happyShift action_13
action_88 (40) = happyShift action_14
action_88 (42) = happyShift action_15
action_88 (4) = happyGoto action_37
action_88 (5) = happyGoto action_4
action_88 (8) = happyGoto action_89
action_88 _ = happyFail

action_89 _ = happyReduce_32

action_90 (18) = happyShift action_113
action_90 _ = happyFail

action_91 (38) = happyShift action_112
action_91 _ = happyFail

action_92 (35) = happyShift action_76
action_92 (37) = happyShift action_111
action_92 _ = happyReduce_48

action_93 (22) = happyShift action_30
action_93 (23) = happyShift action_31
action_93 (24) = happyShift action_32
action_93 (25) = happyShift action_33
action_93 (27) = happyShift action_34
action_93 (34) = happyShift action_35
action_93 (38) = happyShift action_36
action_93 _ = happyReduce_27

action_94 (13) = happyShift action_2
action_94 (14) = happyShift action_5
action_94 (15) = happyShift action_6
action_94 (16) = happyShift action_7
action_94 (17) = happyShift action_8
action_94 (19) = happyShift action_9
action_94 (21) = happyShift action_10
action_94 (28) = happyShift action_11
action_94 (29) = happyShift action_12
action_94 (38) = happyShift action_13
action_94 (40) = happyShift action_14
action_94 (42) = happyShift action_15
action_94 (4) = happyGoto action_110
action_94 (5) = happyGoto action_4
action_94 _ = happyFail

action_95 (28) = happyShift action_109
action_95 (30) = happyShift action_56
action_95 (31) = happyShift action_57
action_95 (32) = happyShift action_58
action_95 (33) = happyShift action_59
action_95 (40) = happyShift action_60
action_95 (42) = happyShift action_61
action_95 (46) = happyShift action_62
action_95 (7) = happyGoto action_108
action_95 (10) = happyGoto action_97
action_95 (12) = happyGoto action_98
action_95 _ = happyFail

action_96 (35) = happyShift action_76
action_96 (42) = happyShift action_107
action_96 _ = happyReduce_48

action_97 (35) = happyShift action_76
action_97 _ = happyReduce_48

action_98 (46) = happyShift action_75
action_98 _ = happyFail

action_99 (35) = happyShift action_76
action_99 (46) = happyReduce_48
action_99 _ = happyReduce_42

action_100 _ = happyReduce_40

action_101 (30) = happyShift action_56
action_101 (31) = happyShift action_57
action_101 (32) = happyShift action_58
action_101 (33) = happyShift action_59
action_101 (40) = happyShift action_60
action_101 (42) = happyShift action_61
action_101 (46) = happyShift action_62
action_101 (10) = happyGoto action_106
action_101 (12) = happyGoto action_55
action_101 _ = happyFail

action_102 _ = happyReduce_44

action_103 _ = happyReduce_8

action_104 (28) = happyShift action_17
action_104 (9) = happyGoto action_105
action_104 _ = happyFail

action_105 _ = happyReduce_34

action_106 (35) = happyShift action_119
action_106 (46) = happyReduce_48
action_106 _ = happyReduce_46

action_107 (13) = happyShift action_2
action_107 (14) = happyShift action_5
action_107 (15) = happyShift action_6
action_107 (16) = happyShift action_7
action_107 (17) = happyShift action_8
action_107 (19) = happyShift action_9
action_107 (21) = happyShift action_10
action_107 (28) = happyShift action_11
action_107 (29) = happyShift action_12
action_107 (38) = happyShift action_13
action_107 (40) = happyShift action_14
action_107 (42) = happyShift action_15
action_107 (4) = happyGoto action_118
action_107 (5) = happyGoto action_4
action_107 _ = happyFail

action_108 _ = happyReduce_30

action_109 (36) = happyShift action_51
action_109 _ = happyFail

action_110 (22) = happyShift action_30
action_110 (23) = happyShift action_31
action_110 (24) = happyShift action_32
action_110 (25) = happyShift action_33
action_110 (27) = happyShift action_34
action_110 (34) = happyShift action_35
action_110 (38) = happyShift action_36
action_110 (43) = happyShift action_117
action_110 _ = happyFail

action_111 (13) = happyShift action_2
action_111 (14) = happyShift action_5
action_111 (15) = happyShift action_6
action_111 (16) = happyShift action_7
action_111 (17) = happyShift action_8
action_111 (19) = happyShift action_9
action_111 (21) = happyShift action_10
action_111 (28) = happyShift action_11
action_111 (29) = happyShift action_12
action_111 (38) = happyShift action_13
action_111 (40) = happyShift action_14
action_111 (42) = happyShift action_15
action_111 (4) = happyGoto action_116
action_111 (5) = happyGoto action_4
action_111 _ = happyFail

action_112 (28) = happyShift action_115
action_112 _ = happyFail

action_113 (42) = happyShift action_114
action_113 _ = happyFail

action_114 (13) = happyShift action_2
action_114 (14) = happyShift action_5
action_114 (15) = happyShift action_6
action_114 (16) = happyShift action_7
action_114 (17) = happyShift action_8
action_114 (19) = happyShift action_9
action_114 (21) = happyShift action_10
action_114 (28) = happyShift action_11
action_114 (29) = happyShift action_12
action_114 (38) = happyShift action_13
action_114 (40) = happyShift action_14
action_114 (42) = happyShift action_15
action_114 (4) = happyGoto action_124
action_114 (5) = happyGoto action_4
action_114 _ = happyFail

action_115 (28) = happyShift action_123
action_115 _ = happyFail

action_116 (22) = happyShift action_30
action_116 (23) = happyShift action_31
action_116 (24) = happyShift action_32
action_116 (25) = happyShift action_33
action_116 (27) = happyShift action_34
action_116 (34) = happyShift action_35
action_116 (38) = happyShift action_36
action_116 (45) = happyShift action_122
action_116 _ = happyFail

action_117 _ = happyReduce_9

action_118 (22) = happyShift action_30
action_118 (23) = happyShift action_31
action_118 (24) = happyShift action_32
action_118 (25) = happyShift action_33
action_118 (27) = happyShift action_34
action_118 (34) = happyShift action_35
action_118 (38) = happyShift action_36
action_118 (43) = happyShift action_121
action_118 _ = happyFail

action_119 (28) = happyShift action_72
action_119 (30) = happyShift action_56
action_119 (31) = happyShift action_57
action_119 (32) = happyShift action_58
action_119 (33) = happyShift action_59
action_119 (40) = happyShift action_60
action_119 (42) = happyShift action_61
action_119 (46) = happyShift action_62
action_119 (10) = happyGoto action_97
action_119 (11) = happyGoto action_120
action_119 (12) = happyGoto action_98
action_119 _ = happyFail

action_120 _ = happyReduce_45

action_121 _ = happyReduce_10

action_122 _ = happyReduce_25

action_123 (39) = happyShift action_126
action_123 _ = happyFail

action_124 (22) = happyShift action_30
action_124 (23) = happyShift action_31
action_124 (24) = happyShift action_32
action_124 (25) = happyShift action_33
action_124 (27) = happyShift action_34
action_124 (34) = happyShift action_35
action_124 (38) = happyShift action_36
action_124 (43) = happyShift action_125
action_124 _ = happyFail

action_125 _ = happyReduce_15

action_126 (42) = happyShift action_127
action_126 _ = happyFail

action_127 (13) = happyShift action_2
action_127 (14) = happyShift action_5
action_127 (15) = happyShift action_6
action_127 (16) = happyShift action_7
action_127 (17) = happyShift action_8
action_127 (19) = happyShift action_9
action_127 (21) = happyShift action_10
action_127 (28) = happyShift action_11
action_127 (29) = happyShift action_12
action_127 (38) = happyShift action_13
action_127 (40) = happyShift action_14
action_127 (42) = happyShift action_15
action_127 (4) = happyGoto action_128
action_127 (5) = happyGoto action_4
action_127 _ = happyFail

action_128 (22) = happyShift action_30
action_128 (23) = happyShift action_31
action_128 (24) = happyShift action_32
action_128 (25) = happyShift action_33
action_128 (27) = happyShift action_34
action_128 (34) = happyShift action_35
action_128 (38) = happyShift action_36
action_128 (43) = happyShift action_129
action_128 _ = happyFail

action_129 _ = happyReduce_16

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
		 (EVar (happy_var_1)
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

happyReduce_9 = happyReduce 7 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELam [] happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 8 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ELam happy_var_2 happy_var_5 happy_var_7
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
		 (ECase happy_var_2 happy_var_4 (happy_var_7) (happy_var_8) happy_var_11
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
		 (ELet (happy_var_1) happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 5 5 happyReduction_27
happyReduction_27 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet (happy_var_1) happy_var_3 happy_var_5
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
		 ((happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_3  7 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn7
		 ([(happy_var_1, happy_var_3)]
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

happyReduce_38 = happySpecReduce_1  10 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn10
		 (TBool
	)

happyReduce_39 = happySpecReduce_1  10 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn10
		 (TDouble
	)

happyReduce_40 = happySpecReduce_3  10 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TList happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  10 happyReduction_41
happyReduction_41 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TLam [] happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  10 happyReduction_42
happyReduction_42 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (TLam happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  10 happyReduction_43
happyReduction_43 _
	_
	 =  HappyAbsSyn10
		 (TObject M.empty
	)

happyReduce_44 = happySpecReduce_3  10 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (TObject (M.fromList happy_var_2)
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happyReduce 5 11 happyReduction_45
happyReduction_45 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 ((happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_3  11 happyReduction_46
happyReduction_46 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn11
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  12 happyReduction_47
happyReduction_47 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1:happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  12 happyReduction_48
happyReduction_48 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_48 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 13;
	TokenDouble happy_dollar_dollar -> cont 14;
	TokenTrue -> cont 15;
	TokenFalse -> cont 16;
	TokenIf -> cont 17;
	TokenElse -> cont 18;
	TokenCase -> cont 19;
	TokenIn -> cont 20;
	TokenSource -> cont 21;
	TokenPlus -> cont 22;
	TokenTimes -> cont 23;
	TokenMinus -> cont 24;
	TokenDivide -> cont 25;
	TokenEqual -> cont 26;
	TokenEquals -> cont 27;
	TokenVar happy_dollar_dollar -> cont 28;
	TokenString happy_dollar_dollar -> cont 29;
	TokenTInt -> cont 30;
	TokenTDouble -> cont 31;
	TokenTBool -> cont 32;
	TokenTString -> cont 33;
	TokenDot -> cont 34;
	TokenComma -> cont 35;
	TokenColon -> cont 36;
	TokenSemiColon -> cont 37;
	TokenPO -> cont 38;
	TokenPC -> cont 39;
	TokenSBO -> cont 40;
	TokenSBC -> cont 41;
	TokenBO -> cont 42;
	TokenBC -> cont 43;
	TokenAO -> cont 44;
	TokenAC -> cont 45;
	TokenArrow -> cont 46;
	_ -> happyError' (tk:tks)
	}

happyError_ 47 tk tks = happyError' tks
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
parseError s = error $ "Parse error at: " ++ unwords (map renderToken s)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 16 "<built-in>" #-}
{-# LINE 1 "/Users/dbp/.stack/programs/x86_64-osx/ghc-7.10.3/lib/ghc-7.10.3/include/ghcversion.h" #-}


















{-# LINE 17 "<built-in>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 


{-# LINE 13 "templates/GenericTemplate.hs" #-}


{-# LINE 46 "templates/GenericTemplate.hs" #-}









{-# LINE 67 "templates/GenericTemplate.hs" #-}


{-# LINE 77 "templates/GenericTemplate.hs" #-}










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

