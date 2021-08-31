#!/usr/bin/env bats

load test_helper

# `nb ls` #####################################################################

@test "'ls -p <number>' paginates list using value from \$NB_LIMIT." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done

    "${_NB}" set limit 3
  }

  run "${_NB}" ls -p 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls -p 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls -p 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" ls -p 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" ls -p 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" ls -p 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]

  {
    "${_NB}" set limit 5
  }

  run "${_NB}" ls -p 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" ls -p 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" ls -p 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" ls -p 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}

@test "'ls --page <number>' paginates list using value from \$NB_LIMIT." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done

    "${_NB}" set limit 3
  }

  run "${_NB}" ls --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" ls --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" ls --page 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" ls --page 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]

  {
    "${_NB}" set limit 5
  }

  run "${_NB}" ls --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" ls --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" ls --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" ls --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}

@test "'ls --per-page <limit> [--page <number>]' paginates list." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done
  }

  # --per-page 3, first page

  run "${_NB}" ls --per-page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls --per-page 3 --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" ls --per-page 3 --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  # --per-page 3 --page 2+

  run "${_NB}" ls --per-page 3 --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" ls --per-page 3 --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" ls --per-page 3 --page 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  # --per-page 5

  run "${_NB}" ls --per-page 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" ls --per-page 5 --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" ls --per-page 5 --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}

# `nb` ########################################################################

@test "'nb -p <number>' paginates list using value from \$NB_LIMIT." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done

    "${_NB}" set limit 3
  }

  run "${_NB}" -p 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" -p 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" -p 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" -p 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" -p 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" -p 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]

  {
    "${_NB}" set limit 5
  }

  run "${_NB}" -p 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" -p 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" -p 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" -p 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}

@test "'nb --page <number>' paginates list using value from \$NB_LIMIT." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done

    "${_NB}" set limit 3
  }

  run "${_NB}" --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" --page 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" --page 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]

  {
    "${_NB}" set limit 5
  }

  run "${_NB}" --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}

@test "'nb --per-page <limit> [--page <number>]' paginates list." {
  {
    "${_NB}" init

    local __number=
    for   __number in One Two Three Four Five Six Seven Eight Nine Ten
    do
      "${_NB}" add "File ${__number}.md" --title "Title ${__number}"
    done
  }

  # --per-page 3, first page

  run "${_NB}" --per-page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" --per-page 3 --page 1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  run "${_NB}" --per-page 3 --page 0

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]

  # --per-page 3 --page 2+

  run "${_NB}" --per-page 3 --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[1]}"  =~  .*[.*6.*].*\ Title\ Six   ]]
  [[ "${lines[2]}"  =~  .*[.*5.*].*\ Title\ Five  ]]

  run "${_NB}" --per-page 3 --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 3                         ]]

  [[ "${lines[0]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[1]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[2]}"  =~  .*[.*2.*].*\ Title\ Two   ]]

  run "${_NB}" --per-page 3 --page 4

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 1                         ]]

  [[ "${lines[0]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  # --per-page 5

  run "${_NB}" --per-page 5

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*10.*].*\ Title\ Ten  ]]
  [[ "${lines[1]}"  =~  .*[.*9.*].*\ Title\ Nine  ]]
  [[ "${lines[2]}"  =~  .*[.*8.*].*\ Title\ Eight ]]
  [[ "${lines[3]}"  =~  .*[.*7.*].*\ Title\ Seven ]]
  [[ "${lines[4]}"  =~  .*[.*6.*].*\ Title\ Six   ]]

  run "${_NB}" --per-page 5 --page 2

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 5                         ]]

  [[ "${lines[0]}"  =~  .*[.*5.*].*\ Title\ Five  ]]
  [[ "${lines[1]}"  =~  .*[.*4.*].*\ Title\ Four  ]]
  [[ "${lines[2]}"  =~  .*[.*3.*].*\ Title\ Three ]]
  [[ "${lines[3]}"  =~  .*[.*2.*].*\ Title\ Two   ]]
  [[ "${lines[4]}"  =~  .*[.*1.*].*\ Title\ One   ]]

  run "${_NB}" --per-page 5 --page 3

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[ "${status}"    -eq 0                         ]]
  [[ "${#lines[@]}" -eq 0                         ]]
}