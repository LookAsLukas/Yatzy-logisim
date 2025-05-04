void fix_for_straight(const int *cubes, int *fixed) {
    int i = 0, target = 2;
    int has_1 = 0, has_6 = 0, fixed_extreme = 0;

    while (i < 5) {
        if (cubes[i] == 1) has_1 = 1;
        if (cubes[i] == 6) has_6 = 1;
        i++;
    }

    i = 0;
    while (i < 5 && !fixed_extreme) {
        if (has_6 && cubes[i] == 6) {
            fixed[i] = 6;
            fixed_extreme = 1;
        } else if (has_1 && cubes[i] == 1) {
            fixed[i] = 1;
            fixed_extreme = 1;
        }
        i++;
    }

    while (target <= 5) {
        i = 0;
        while (i < 5) {
            if (cubes[i] == target && fixed[i] == 0) {
                fixed[i] = target;
                break;
            }
            i++;
        }
        target++;
    }
}

void count_values(const int *cubes, int *counts) {
    int i = 0;
    while (i < 5) {
        int val = cubes[i];
        int j = 1;
        while (j <= 6) {
            if (val == j) {
                counts[j - 1]++;
                break;
            }
            j++;
        }
        i++;
    }
}

int find_best_value_to_fix(const int *counts, const int *pattern) {
    int best_value = -1;
    int max_count = 0;
    int i = 0;

    while (i < 6) {
        if (counts[i] > max_count) {
            max_count = counts[i];
        }
        i++;
    }

    if (max_count == 0) {
        return -1;
    }

    i = 5;
    while (i >= 0) {
        if (counts[i] == max_count && pattern[i] == 0) {
            return i + 1;
        }
        i--;
    }

    i = 5;
    while (i >= 0) {
        if (counts[i] == max_count) {
            return i + 1;
        }
        i--;
    }

    return best_value;
}

int find_max_value(const int *cubes) {
    int max_value = 0;
    int i = 0;
    while (i < 5) {
        if (cubes[i] > max_value) {
            max_value = cubes[i];
        }
        i++;
    }
    return max_value;
}

void keep_only_value(const int *cubes, int *fixed, int value) {
    int i = 0;
    while (i < 5) {
        if (cubes[i] == value) {
            fixed[i] = cubes[i];
        } else {
            fixed[i] = 0;
        }
        i++;
    }
}

int calculate_score(const int *cubes, int number) {
    int score = 0;
    int i = 0;
    while (i < 5) {
        if (cubes[i] == number) {
            int j = 0;
            while (j < number) {
                score++;
                j++;
            }
        }
        i++;
    }
    return score;
}

int calculate_three_of_a_kind(const int *cubes) {
    int i = 1;
    while (i <= 6) {
        int count = 0;
        int sum = 0;
        int j = 0;
        while (j < 5) {
            sum += cubes[j];
            if (cubes[j] == i) {
                count++;
            }
            j++;
        }
        if (count >= 3) {
            return sum;
        }
        i++;
    }
    return 0;
}

int calculate_four_of_a_kind(const int *cubes) {
    int i = 1;
    while (i <= 6) {
        int count = 0;
        int sum = 0;
        int j = 0;
        while (j < 5) {
            sum += cubes[j];
            if (cubes[j] == i) {
                count++;
            }
            j++;
        }
        if (count >= 4) {
            return sum;
        }
        i++;
    }
    return 0;
}

int calculate_full_house(const int *cubes) {
    int counts[6] = {0};
    int i = 0;
    int has_three = 0, has_two = 0;
    count_values(cubes, counts);

    while (i < 6) {
        if (counts[i] == 3) has_three = 1;
        if (counts[i] == 2) has_two = 1;
        i++;
    }
    if (has_three && has_two) {
        return 25;
    }
    return 0;
}

int calculate_straight(const int *cubes) {
    int counts[6] = {0};
    count_values(cubes, counts);

    if (counts[0] && counts[1] && counts[2] && counts[3] && counts[4]) {
        return 40;
    }
    if (counts[1] && counts[2] && counts[3] && counts[4] && counts[5]) {
        return 40;
    }
    return 0;
}

int calculate_yahtzee(const int *cubes) {
    int i = 1;
    while (i < 5) {
        if (cubes[i] != cubes[0]) {
            return 0;
        }
        i++;
    }
    return 50;
}

int find_best_pattern2(const int *cubes, const int *pattern) {
    int i = 0;
    int best_pattern = -1;
    int max_score = 0;

    while (i < 6) {
        if (pattern[i] == 0) {
            int score = calculate_score(cubes, i + 1);
            if (score >= max_score) {
                max_score = score;
                best_pattern = i;
            }
        }
        i++;
    }

    if (pattern[6] == 0) {
        int score = calculate_three_of_a_kind(cubes);
        if (score >= max_score) {
            max_score = score;
            best_pattern = 6;
        }
    }
    if (pattern[7] == 0) {
        int score = calculate_four_of_a_kind(cubes);
        if (score >= max_score) {
            max_score = score;
            best_pattern = 7;
        }
    }
    if (pattern[8] == 0) {
        int score = calculate_full_house(cubes);
        if (score >= max_score) {
            max_score = score;
            best_pattern = 8;
        }
    }
    if (pattern[9] == 0) {
        int score = calculate_straight(cubes);
        if (score >= max_score) {
            max_score = score;
            best_pattern = 9;
        }
    }
    if (pattern[10] == 0) {
        int score = calculate_yahtzee(cubes);
        if (score >= max_score) {
            best_pattern = 10;
        }
    }
    return best_pattern;
}

void fix_for_multiple(const int *cubes, int *fixed, const int *pattern) {
    int counts[6] = {0};
    count_values(cubes, counts);
    int value_to_fix = find_best_value_to_fix(counts, pattern);
    if (value_to_fix <= 0) {
        value_to_fix = find_max_value(cubes);
    }
    keep_only_value(cubes, fixed, value_to_fix);
}

void fix_for_yahtzee(const int *cubes, int *fixed, const int *pattern) {
    fix_for_multiple(cubes, fixed, pattern);
}

void fix_for_four_of_a_kind(const int *cubes, int *fixed, const int *pattern) {
    fix_for_multiple(cubes, fixed, pattern);
}

void fix_for_three_of_a_kind(const int *cubes, int *fixed, const int *pattern) {
    fix_for_multiple(cubes, fixed, pattern);
}

void fix_for_full_house(const int *cubes, int *fixed, const int *pattern) {
    int counts[6] = {0};
    int three_value = 0, two_value = 0;
    int has_three = 0, has_two = 0;
    int i = 0;

    count_values(cubes, counts);

    while (i < 6) {
        if (counts[i] == 3) {
            has_three = 1;
            three_value = i + 1;
        } else if (counts[i] == 2) {
            has_two = 1;
            two_value = i + 1;
        }
        i++;
    }

    if (has_three && has_two) {
        i = 0;
        while (i < 5) {
            fixed[i] = cubes[i];
            i++;
        }
    } else if (has_three) {
        keep_only_value(cubes, fixed, three_value);
    } else if (has_two) {
        keep_only_value(cubes, fixed, two_value);
    } else {
        int max_value = find_max_value(cubes);
        keep_only_value(cubes, fixed, max_value);
    }
}

void fix_num(const int *cubes, int *fixed, const int *pattern) {
    int counts[6] = {0};
    count_values(cubes, counts);
    int value_to_fix = find_best_value_to_fix(counts, pattern);
    if (value_to_fix <= 0) {
        value_to_fix = find_max_value(cubes);
    }
    keep_only_value(cubes, fixed, value_to_fix);
}


int global_pattern[11];       
int global_cubes[5];          
int global_fixed[5];          
unsigned short global_end;    

void decision(int roll) {
    if (!global_pattern[10] && calculate_yahtzee(global_cubes)) {
        fix_for_yahtzee(global_cubes, global_fixed, global_pattern);
        global_end = 1;
    } else if (!global_pattern[9] && calculate_straight(global_cubes)) {
        fix_for_straight(global_cubes, global_fixed);
        global_end = 1;
    } else if (!global_pattern[8] && calculate_full_house(global_cubes)) {
        fix_for_full_house(global_cubes, global_fixed, global_pattern);
        global_end = 1;
    } else if (global_pattern[10] && !global_pattern[7] && calculate_four_of_a_kind(global_cubes)) {
        fix_for_four_of_a_kind(global_cubes, global_fixed, global_pattern);
        global_end = 1;
    } else if (global_pattern[10] && global_pattern[7] && !global_pattern[6] && calculate_three_of_a_kind(global_cubes)) {
        fix_for_three_of_a_kind(global_cubes, global_fixed, global_pattern);
        global_end = 1;
    } else {
        fix_num(global_cubes, global_fixed, global_pattern);
    }

    if (roll == 2) {
        global_end = 1;
    }
}


unsigned short play(unsigned short cubes_in, unsigned short patterns_in, unsigned short end) {
    int i = 0;
    while (i < 11) {
        global_pattern[i] = patterns_in & 1;
        patterns_in >>= 1;
        i++;
    }

    i = 0;
    while (i < 5) {
        global_cubes[i] = cubes_in & 7;
        cubes_in >>= 3;
        i++;
    }

    for (i = 0; i < 5; i++) {
        global_fixed[i] = 0;
    }
    global_end = end;

    int roll = 0;
    decision(roll);

    unsigned short res = 0;

    if (global_end) {
        int best = find_best_pattern2(global_cubes, global_pattern);
        if (best == -1) {
            int j = 10;
            while (j >= 0) {
                if (global_pattern[j] == 0) {
                    best = j;
                    break;
                }
                j--;
            }
        }
        res = 0x8000;
        res |= best & 15;
    } else {
        int b0 = (global_fixed[0] != 0);
        int b1 = (global_fixed[1] != 0);
        int b2 = (global_fixed[2] != 0);
        int b3 = (global_fixed[3] != 0);
        int b4 = (global_fixed[4] != 0);
        res = (b4 << 4) | (b3 << 3) | (b2 << 2) | (b1 << 1) | (b0);

        // int j = 4;
        // while (j >= 0) {
        //     res |= (global_fixed[j] != 0);
        //     if (j == 0) {
        //         j--;
        //         continue;
        //     }
        //     res <<= 1;
        //     j--;
        // }
    }

    return res;
}