#!/bin/bash

# Fonction pour exécuter un test et demander confirmation pour continuer
run_test() {
    local test_name=$1

    while true; do
        # Exécuter le test
        ./$test_name
        if [ $? -ne 0 ]; then
            echo -e "Test $test_name failed.\n"
        else
            echo -e "Test $test_name passed.\n"
        fi

        # Demander confirmation pour continuer
        read -p "Do you want to continue? (y/n/r): " choice
        case $choice in
            y|Y)
                return 0
                ;;
            n|N)
                echo "Stopping tests."
                return 1
                ;;
            r|R)
                echo "Restarting $test_name..."
                ;;
            *)
                echo "Invalid option. Please enter y (yes), n (no), or r (restart)."
                ;;
        esac
    done
}

# Fonction pour exécuter tous les tests automatiquement
run_all_tests() {
    local all_passed=true

    for test in "${tests[@]}"; do
        ./$test
        if [ $? -ne 0 ]; then
            all_passed=false
            echo "Test $test failed."
        fi
    done

    if [ "$include_bonus" = true ]; then
        for test in "${testsBonus[@]}"; do
            ./$test
            if [ $? -ne 0 ]; then
                all_passed=false
                echo "Test $test failed."
            fi
        done
    fi

    if $all_passed; then
        echo "-----> all tests passed <-----"
    else
        echo "Some tests failed."
    fi
}

# Liste des tests à exécuter
tests=(
    "test_ft_isalpha.out"
    "test_ft_isdigit.out"
    "test_ft_isalnum.out"
    "test_ft_isascii.out"
    "test_ft_isprint.out"
    "test_ft_strlen.out"
    "test_ft_memset.out"
    "test_ft_bzero.out"
    "test_ft_memcpy.out"
    "test_ft_memmove.out"
    "test_ft_strlcpy.out"
    "test_ft_strlcat.out"
    "test_ft_toupper.out"
    "test_ft_tolower.out"
    "test_ft_strchr.out"
    "test_ft_strrchr.out"
    "test_ft_strncmp.out"
    "test_ft_memchr.out"
    "test_ft_memcmp.out"
    "test_ft_strnstr.out"
    "test_ft_atoi.out"
    "test_ft_calloc.out"
    "test_ft_strdup.out"
    "test_ft_substr.out"
    "test_ft_strjoin.out"
    "test_ft_strtrim.out"
    "test_ft_split.out"
    "test_ft_itoa.out"
    "test_ft_strmapi.out"
    "test_ft_striteri.out"
    "test_ft_putchar_fd.out"
    "test_ft_putstr_fd.out"
    "test_ft_putendl_fd.out"
    "test_ft_putnbr_fd.out"
)

testsBonus=(
    "test_ft_lstnew.out"
    "test_ft_lstadd_front.out"
    "test_ft_lstdelone.out"
    "test_ft_lstsize.out"
    "test_ft_lstlast.out"
    "test_ft_lstadd_back.out"
    "test_ft_lstclear.out"
    "test_ft_lstiter.out"
    "test_ft_lstmap.out"
)

# Demander le mode d'exécution
read -p "Do you want to run in normal mode or auto-run mode? (n/a): " mode
case $mode in
    n|N)
        mode="normal"
        ;;
    a|A)
        mode="auto"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

# Demander le répertoire des tests
read -p "Enter the directory containing the test executables (default: ./): " test_dir
test_dir=${test_dir:-./}

# Vérifier si le répertoire existe
if [ ! -d "$test_dir" ]; then
    echo "Directory $test_dir does not exist."
    exit 1
fi

# Demander si on veut exécuter les tests bonus
read -p "Do you want to include bonus tests? (y/n): " choice
case $choice in
    y|Y)
        include_bonus=true
        ;;
    n|N)
        include_bonus=false
        ;;
    *)
        echo "Invalid option. Skipping bonus tests."
        include_bonus=false
        ;;
esac

if [ "$mode" = "normal" ]; then
    # Exécuter chaque test individuellement avec demande de confirmation
    for test in "${tests[@]}"; do
        (cd "$test_dir" && run_test $test)
        if [ $? -ne 0 ]; then
            exit 0
        fi
    done

    if [ "$include_bonus" = true ]; then
        echo "--------------------------------"
        echo "Start tests bonus"
        echo "--------------------------------"
        for test in "${testsBonus[@]}"; do
            (cd "$test_dir" && run_test $test)
            if [ $? -ne 0 ]; then
                exit 0
            fi
        done
    fi

    # Demander confirmation pour relancer tous les tests automatiquement
    read -p "Do you want to rerun all tests automatically? (y/n): " rerun_choice
    case $rerun_choice in
        y|Y)
            (cd "$test_dir" && run_all_tests)
            ;;
        n|N)
            echo "Skipping rerun of all tests."
            ;;
        *)
            echo "Invalid option. Skipping rerun of all tests."
            ;;
    esac
else
    # Exécuter tous les tests automatiquement
    (cd "$test_dir" && run_all_tests)
fi