function fish_greeting
    set --local colors R G Y B M C K
    set --local codes 1m 2m 3m 4m 5m 6m 7m
    for idx in (seq 1 7)
        echo -en  "\e[0;1;3$codes[$idx] $colors[$idx] \e[1;30;4$codes[$idx] $idx "
    end
    echo -e "\033[m "
    for idx in (seq 1 7)
        echo -en  "\e[1;30;10$codes[$idx] $colors[$idx] \e[0;1;3$codes[$idx] $idx "
    end
    echo -e "\033[m "
end
