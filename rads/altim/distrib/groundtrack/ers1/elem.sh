#!/bin/csh -f
cat ../orbelem.head > orbelem.out
foreach arc ( {0,1,2,3,4,5,8,9}{0,1,2,3,4,5,6,7,8,9}{0,1,2,3,4,5,6,7,8,9} )
../orbelem /user/remko/ers/ODR.ERS-1/latest/ODR.$arc >> orbelem.out
end
