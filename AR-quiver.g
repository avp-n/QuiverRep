################################################################################
#
# GAP files for working with AR-Theory & quivers w/ examples.
#
# Read("AR-quiver.g");
#
# Authored by AVP Neelam
#
################################################################################

LoadPackage("qpa");

################################################################################
#
# getIndecom(kQ)
#
# returns the list of all indecomposable representations of Q over field k
# note that the input is PathAlgebra(k, Q);
#
################################################################################
getIndec := function(kQ, pflag)
local S, P, I, M, indec, dimIndec, dim;

	S := SimpleModules(kQ);
	P := IndecProjectiveModules(kQ);
	I := IndecInjectiveModules(kQ);
	
	indec := [];
	
	for M in S do if not M in indec then Add(indec, M); fi; od;
	for M in P do if not M in indec then Add(indec, M); fi; od;
	for M in I do if not M in indec then Add(indec, M); fi; od;

	dimIndec := [];
	for M in indec do
		Add(dimIndec, DimensionVector(M));
	od;
	
	if pflag then
		Print("Indecomposable Reps. of Q: \n");
		for dim in dimIndec do
			Print("\t", dim, "\n");
		od;
	fi;
	
	return dimIndec;
end;
################################################################################

################################################################################
#
# Example 1:
#
# Let Q = 1 --> 2. Find all indecomposable representations of Q.
#
################################################################################
Q := Quiver(2, [ [1,2,"a"] ]);
kQ := PathAlgebra(GF(3), Q);
getIndec(kQ, true);
# we see that the indecomposable reps are S(1), S(2), and M = k --> k.
S1 := SimpleModules(kQ)[1];;
S2 := SimpleModules(kQ)[2];;
M := IndecProjectiveModules(kQ)[1];; # M := IndecInjectiveModules(kQ)[2];;
#Print(AlmostSplitSequence(M), "\n");
#Print(AlmostSplitSequence(S2), "\n");
#Print(AlmostSplitSequence(S1), "\n");


# 1 --> 2
Q1 := Quiver(2, [ [1,2,"a"] ]);

# 1 --> 2 <-- 3
Q2 := Quiver(3, [ [1,2,"a"],[3,2,"b"] ]); 

# 1 -->
#       3 <-- 4
# 2 -->
Q3 := Quiver(4, [ [1,3,"a"],[2,3,"b"],[4,3,"c"] ]);

k := GF(2);
