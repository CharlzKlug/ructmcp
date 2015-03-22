declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

declare
fun {Comb N R}
   {Fact N} div ({Fact R}*{Fact N-R})
end


declare Pascal AddList ShiftLeft ShiftRight
fun {Pascal N}
   if N==1 then [1]
   else
      {AddList {ShiftLeft {Pascal N-1}}
       {ShiftRight {Pascal N-1}}}
   end
end


fun lazy {Ints N}
   N|{Ints N+1}
end

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
         H1+H2|{AddList T1 T2}
      end
   else nil end
end

fun lazy {PascalList Row}
   Row|{PascalList
        {AddList {ShiftLeft Row}
         {ShiftRight Row}}}
end

fun {PascalList2 N Row}
   if N==1 then [Row]
   else
      Row|{PascalList2 N-1
           {AddList {ShiftLeft Row}
            {ShiftRight Row}}}
   end
end

fun {OpList Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
         {Op H1 H2}|{OpList Op T1 T2}
      end
   else nil end
end


fun {GenericPascal Op N}
   if N==1 then [1]
   else L in
      L={GenericPascal Op N-1}
      {OpList Op {ShiftLeft L} {ShiftRight L}}
   end
end

fun {Add X Y} X+Y end

fun {FastPascal N} {GenericPascal Add N} end

fun {Xor X Y} if X==Y then 0 else 1 end end

{Browse {GenericPascal Xor 5}}