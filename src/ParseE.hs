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
action_0 (25) = happyShift action_9
action_0 (26) = happyShift action_10
action_0 (32) = happyShift action_11
action_0 (34) = happyShift action_12
action_0 (36) = happyShift action_13
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (11) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (29) = happyShift action_26
action_3 (32) = happyShift action_27
action_3 (41) = happyAccept
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
action_7 (25) = happyShift action_9
action_7 (26) = happyShift action_10
action_7 (32) = happyShift action_11
action_7 (34) = happyShift action_12
action_7 (36) = happyShift action_13
action_7 (4) = happyGoto action_25
action_7 _ = happyFail

action_8 (11) = happyShift action_2
action_8 (12) = happyShift action_4
action_8 (13) = happyShift action_5
action_8 (14) = happyShift action_6
action_8 (15) = happyShift action_7
action_8 (17) = happyShift action_8
action_8 (25) = happyShift action_9
action_8 (26) = happyShift action_10
action_8 (32) = happyShift action_11
action_8 (34) = happyShift action_12
action_8 (36) = happyShift action_13
action_8 (4) = happyGoto action_24
action_8 _ = happyFail

action_9 (24) = happyShift action_23
action_9 _ = happyReduce_5

action_10 _ = happyReduce_6

action_11 (25) = happyShift action_21
action_11 (33) = happyShift action_22
action_11 (6) = happyGoto action_20
action_11 _ = happyFail

action_12 (11) = happyShift action_2
action_12 (12) = happyShift action_4
action_12 (13) = happyShift action_5
action_12 (14) = happyShift action_6
action_12 (15) = happyShift action_7
action_12 (17) = happyShift action_8
action_12 (25) = happyShift action_9
action_12 (26) = happyShift action_10
action_12 (31) = happyShift action_19
action_12 (32) = happyShift action_11
action_12 (34) = happyShift action_12
action_12 (36) = happyShift action_13
action_12 (4) = happyGoto action_17
action_12 (5) = happyGoto action_18
action_12 _ = happyFail

action_13 (25) = happyShift action_15
action_13 (37) = happyShift action_16
action_13 (8) = happyGoto action_14
action_13 _ = happyFail

action_14 (37) = happyShift action_47
action_14 _ = happyFail

action_15 (31) = happyShift action_46
action_15 _ = happyFail

action_16 _ = happyReduce_13

action_17 (29) = happyShift action_26
action_17 (30) = happyShift action_45
action_17 (32) = happyShift action_27
action_17 _ = happyReduce_20

action_18 (31) = happyShift action_44
action_18 _ = happyFail

action_19 (27) = happyShift action_40
action_19 (28) = happyShift action_41
action_19 (34) = happyShift action_42
action_19 (40) = happyShift action_43
action_19 (9) = happyGoto action_38
action_19 (10) = happyGoto action_39
action_19 _ = happyFail

action_20 (33) = happyShift action_37
action_20 _ = happyFail

action_21 (31) = happyShift action_36
action_21 _ = happyFail

action_22 (36) = happyShift action_35
action_22 _ = happyFail

action_23 (11) = happyShift action_2
action_23 (12) = happyShift action_4
action_23 (13) = happyShift action_5
action_23 (14) = happyShift action_6
action_23 (15) = happyShift action_7
action_23 (17) = happyShift action_8
action_23 (25) = happyShift action_9
action_23 (26) = happyShift action_10
action_23 (32) = happyShift action_11
action_23 (34) = happyShift action_12
action_23 (36) = happyShift action_13
action_23 (4) = happyGoto action_34
action_23 _ = happyFail

action_24 (29) = happyShift action_26
action_24 (32) = happyShift action_27
action_24 (36) = happyShift action_33
action_24 _ = happyFail

action_25 (29) = happyShift action_26
action_25 (32) = happyShift action_27
action_25 (36) = happyShift action_32
action_25 _ = happyFail

action_26 (25) = happyShift action_31
action_26 _ = happyFail

action_27 (11) = happyShift action_2
action_27 (12) = happyShift action_4
action_27 (13) = happyShift action_5
action_27 (14) = happyShift action_6
action_27 (15) = happyShift action_7
action_27 (17) = happyShift action_8
action_27 (25) = happyShift action_9
action_27 (26) = happyShift action_10
action_27 (32) = happyShift action_11
action_27 (33) = happyShift action_30
action_27 (34) = happyShift action_12
action_27 (36) = happyShift action_13
action_27 (4) = happyGoto action_28
action_27 (7) = happyGoto action_29
action_27 _ = happyFail

action_28 (29) = happyShift action_26
action_28 (30) = happyShift action_63
action_28 (32) = happyShift action_27
action_28 _ = happyReduce_24

action_29 (33) = happyShift action_62
action_29 _ = happyFail

action_30 _ = happyReduce_11

action_31 _ = happyReduce_17

action_32 (11) = happyShift action_2
action_32 (12) = happyShift action_4
action_32 (13) = happyShift action_5
action_32 (14) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (17) = happyShift action_8
action_32 (25) = happyShift action_9
action_32 (26) = happyShift action_10
action_32 (32) = happyShift action_11
action_32 (34) = happyShift action_12
action_32 (36) = happyShift action_13
action_32 (4) = happyGoto action_61
action_32 _ = happyFail

action_33 (11) = happyShift action_2
action_33 (12) = happyShift action_4
action_33 (13) = happyShift action_5
action_33 (14) = happyShift action_6
action_33 (15) = happyShift action_7
action_33 (17) = happyShift action_8
action_33 (25) = happyShift action_9
action_33 (26) = happyShift action_10
action_33 (32) = happyShift action_11
action_33 (34) = happyShift action_12
action_33 (36) = happyShift action_13
action_33 (4) = happyGoto action_60
action_33 _ = happyFail

action_34 (18) = happyShift action_59
action_34 (29) = happyShift action_26
action_34 (32) = happyShift action_27
action_34 _ = happyFail

action_35 (11) = happyShift action_2
action_35 (12) = happyShift action_4
action_35 (13) = happyShift action_5
action_35 (14) = happyShift action_6
action_35 (15) = happyShift action_7
action_35 (17) = happyShift action_8
action_35 (25) = happyShift action_9
action_35 (26) = happyShift action_10
action_35 (32) = happyShift action_11
action_35 (34) = happyShift action_12
action_35 (36) = happyShift action_13
action_35 (4) = happyGoto action_58
action_35 _ = happyFail

action_36 (27) = happyShift action_40
action_36 (28) = happyShift action_41
action_36 (34) = happyShift action_42
action_36 (40) = happyShift action_43
action_36 (9) = happyGoto action_57
action_36 (10) = happyGoto action_39
action_36 _ = happyFail

action_37 (36) = happyShift action_56
action_37 _ = happyFail

action_38 (30) = happyShift action_54
action_38 (35) = happyShift action_55
action_38 _ = happyReduce_33

action_39 (40) = happyShift action_53
action_39 _ = happyFail

action_40 _ = happyReduce_27

action_41 _ = happyReduce_28

action_42 (27) = happyShift action_40
action_42 (28) = happyShift action_41
action_42 (34) = happyShift action_42
action_42 (40) = happyShift action_43
action_42 (9) = happyGoto action_52
action_42 (10) = happyGoto action_39
action_42 _ = happyFail

action_43 (27) = happyShift action_40
action_43 (28) = happyShift action_41
action_43 (34) = happyShift action_42
action_43 (40) = happyShift action_43
action_43 (9) = happyGoto action_51
action_43 (10) = happyGoto action_39
action_43 _ = happyFail

action_44 (27) = happyShift action_40
action_44 (28) = happyShift action_41
action_44 (34) = happyShift action_42
action_44 (40) = happyShift action_43
action_44 (9) = happyGoto action_50
action_44 (10) = happyGoto action_39
action_44 _ = happyFail

action_45 (11) = happyShift action_2
action_45 (12) = happyShift action_4
action_45 (13) = happyShift action_5
action_45 (14) = happyShift action_6
action_45 (15) = happyShift action_7
action_45 (17) = happyShift action_8
action_45 (25) = happyShift action_9
action_45 (26) = happyShift action_10
action_45 (32) = happyShift action_11
action_45 (34) = happyShift action_12
action_45 (36) = happyShift action_13
action_45 (4) = happyGoto action_17
action_45 (5) = happyGoto action_49
action_45 _ = happyFail

action_46 (11) = happyShift action_2
action_46 (12) = happyShift action_4
action_46 (13) = happyShift action_5
action_46 (14) = happyShift action_6
action_46 (15) = happyShift action_7
action_46 (17) = happyShift action_8
action_46 (25) = happyShift action_9
action_46 (26) = happyShift action_10
action_46 (32) = happyShift action_11
action_46 (34) = happyShift action_12
action_46 (36) = happyShift action_13
action_46 (4) = happyGoto action_48
action_46 _ = happyFail

action_47 _ = happyReduce_14

action_48 (29) = happyShift action_26
action_48 (30) = happyShift action_76
action_48 (32) = happyShift action_27
action_48 _ = happyReduce_26

action_49 _ = happyReduce_19

action_50 (30) = happyShift action_54
action_50 (35) = happyShift action_75
action_50 _ = happyReduce_33

action_51 (30) = happyShift action_54
action_51 (40) = happyReduce_33
action_51 _ = happyReduce_30

action_52 (30) = happyShift action_54
action_52 (35) = happyShift action_74
action_52 _ = happyReduce_33

action_53 (27) = happyShift action_40
action_53 (28) = happyShift action_41
action_53 (34) = happyShift action_42
action_53 (40) = happyShift action_43
action_53 (9) = happyGoto action_73
action_53 (10) = happyGoto action_39
action_53 _ = happyFail

action_54 (27) = happyShift action_40
action_54 (28) = happyShift action_41
action_54 (34) = happyShift action_42
action_54 (40) = happyShift action_43
action_54 (9) = happyGoto action_71
action_54 (10) = happyGoto action_72
action_54 _ = happyFail

action_55 _ = happyReduce_7

action_56 (11) = happyShift action_2
action_56 (12) = happyShift action_4
action_56 (13) = happyShift action_5
action_56 (14) = happyShift action_6
action_56 (15) = happyShift action_7
action_56 (17) = happyShift action_8
action_56 (25) = happyShift action_9
action_56 (26) = happyShift action_10
action_56 (32) = happyShift action_11
action_56 (34) = happyShift action_12
action_56 (36) = happyShift action_13
action_56 (4) = happyGoto action_70
action_56 _ = happyFail

action_57 (30) = happyShift action_69
action_57 (40) = happyReduce_33
action_57 _ = happyReduce_22

action_58 (29) = happyShift action_26
action_58 (32) = happyShift action_27
action_58 (37) = happyShift action_68
action_58 _ = happyFail

action_59 (11) = happyShift action_2
action_59 (12) = happyShift action_4
action_59 (13) = happyShift action_5
action_59 (14) = happyShift action_6
action_59 (15) = happyShift action_7
action_59 (17) = happyShift action_8
action_59 (25) = happyShift action_9
action_59 (26) = happyShift action_10
action_59 (32) = happyShift action_11
action_59 (34) = happyShift action_12
action_59 (36) = happyShift action_13
action_59 (4) = happyGoto action_67
action_59 _ = happyFail

action_60 (29) = happyShift action_26
action_60 (32) = happyShift action_27
action_60 (37) = happyShift action_66
action_60 _ = happyFail

action_61 (29) = happyShift action_26
action_61 (32) = happyShift action_27
action_61 (37) = happyShift action_65
action_61 _ = happyFail

action_62 _ = happyReduce_12

action_63 (11) = happyShift action_2
action_63 (12) = happyShift action_4
action_63 (13) = happyShift action_5
action_63 (14) = happyShift action_6
action_63 (15) = happyShift action_7
action_63 (17) = happyShift action_8
action_63 (25) = happyShift action_9
action_63 (26) = happyShift action_10
action_63 (32) = happyShift action_11
action_63 (34) = happyShift action_12
action_63 (36) = happyShift action_13
action_63 (4) = happyGoto action_28
action_63 (7) = happyGoto action_64
action_63 _ = happyFail

action_64 _ = happyReduce_23

action_65 (16) = happyShift action_81
action_65 _ = happyFail

action_66 (32) = happyShift action_80
action_66 _ = happyFail

action_67 (29) = happyShift action_26
action_67 (32) = happyShift action_27
action_67 _ = happyReduce_18

action_68 _ = happyReduce_9

action_69 (25) = happyShift action_21
action_69 (27) = happyShift action_40
action_69 (28) = happyShift action_41
action_69 (34) = happyShift action_42
action_69 (40) = happyShift action_43
action_69 (6) = happyGoto action_79
action_69 (9) = happyGoto action_71
action_69 (10) = happyGoto action_72
action_69 _ = happyFail

action_70 (29) = happyShift action_26
action_70 (32) = happyShift action_27
action_70 (37) = happyShift action_78
action_70 _ = happyFail

action_71 (30) = happyShift action_54
action_71 _ = happyReduce_33

action_72 (40) = happyShift action_53
action_72 _ = happyFail

action_73 (30) = happyShift action_54
action_73 (40) = happyReduce_33
action_73 _ = happyReduce_31

action_74 _ = happyReduce_29

action_75 _ = happyReduce_8

action_76 (25) = happyShift action_15
action_76 (8) = happyGoto action_77
action_76 _ = happyFail

action_77 _ = happyReduce_25

action_78 _ = happyReduce_10

action_79 _ = happyReduce_21

action_80 (25) = happyShift action_83
action_80 _ = happyFail

action_81 (36) = happyShift action_82
action_81 _ = happyFail

action_82 (11) = happyShift action_2
action_82 (12) = happyShift action_4
action_82 (13) = happyShift action_5
action_82 (14) = happyShift action_6
action_82 (15) = happyShift action_7
action_82 (17) = happyShift action_8
action_82 (25) = happyShift action_9
action_82 (26) = happyShift action_10
action_82 (32) = happyShift action_11
action_82 (34) = happyShift action_12
action_82 (36) = happyShift action_13
action_82 (4) = happyGoto action_85
action_82 _ = happyFail

action_83 (25) = happyShift action_84
action_83 _ = happyFail

action_84 (33) = happyShift action_87
action_84 _ = happyFail

action_85 (29) = happyShift action_26
action_85 (32) = happyShift action_27
action_85 (37) = happyShift action_86
action_85 _ = happyFail

action_86 _ = happyReduce_15

action_87 (36) = happyShift action_88
action_87 _ = happyFail

action_88 (11) = happyShift action_2
action_88 (12) = happyShift action_4
action_88 (13) = happyShift action_5
action_88 (14) = happyShift action_6
action_88 (15) = happyShift action_7
action_88 (17) = happyShift action_8
action_88 (25) = happyShift action_9
action_88 (26) = happyShift action_10
action_88 (32) = happyShift action_11
action_88 (34) = happyShift action_12
action_88 (36) = happyShift action_13
action_88 (4) = happyGoto action_89
action_88 _ = happyFail

action_89 (29) = happyShift action_26
action_89 (32) = happyShift action_27
action_89 (37) = happyShift action_90
action_89 _ = happyFail

action_90 _ = happyReduce_16

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

happyReduce_19 = happySpecReduce_3  5 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  5 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 5 6 happyReduction_21
happyReduction_21 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((Var happy_var_1, happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn6
		 ([(Var happy_var_1, happy_var_3)]
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  7 happyReduction_24
happyReduction_24 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 8 happyReduction_25
happyReduction_25 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_1,happy_var_3):happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  8 happyReduction_26
happyReduction_26 (HappyAbsSyn4  happy_var_3)
	_
	(HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn8
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  9 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_28 = happySpecReduce_1  9 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn9
		 (TString
	)

happyReduce_29 = happySpecReduce_3  9 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TList happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  9 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (TLam [] happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  9 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (TLam happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  10 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  10 happyReduction_33
happyReduction_33 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

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
	TokenPO -> cont 32;
	TokenPC -> cont 33;
	TokenSBO -> cont 34;
	TokenSBC -> cont 35;
	TokenBO -> cont 36;
	TokenBC -> cont 37;
	TokenAO -> cont 38;
	TokenAC -> cont 39;
	TokenArrow -> cont 40;
	_ -> happyError' (tk:tks)
	}

happyError_ 41 tk tks = happyError' tks
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
