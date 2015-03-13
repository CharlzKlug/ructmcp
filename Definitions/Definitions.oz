declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

declare
fun {Comb N R}
   {Fact N} div ({Fact R}*{Fact N-R})
end


{Browse {Fact 100}}

{Browse {Comb 10 3}}