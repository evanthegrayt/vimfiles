" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

Abolish -cmdline initaitive{,s} initiative{}
