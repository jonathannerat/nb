#!/usr/bin/env bats
# shellcheck disable=SC2030,SC2031,SC2063

load test_helper

# todos tasks #################################################################

@test "'todos tasks open <folder>/<id>' exits with 0 and lists open tasks." {
  {
    "${_NB}" init

    "${_NB}" add                                    \
      --filename "Example Folder/Todo One.todo.md"  \
      --content "$(cat <<HEREDOC
# [ ] Example todo description one.

## Due

2200-02-02

## Tasks

- [ ] Task one.
- [] Task two.
- [x] Task three.
- [ ] Task four.

## Tags

#tag1 #tag2
HEREDOC
)"
  }

  run "${_NB}" todos tasks open Example\ Folder/1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[    "${status}"     -eq 0                   ]]
  [[    "${#lines[@]}"  -eq 3                   ]]

  [[    "${lines[0]}"   ==  "- [ ] Task one."   ]]
  [[    "${lines[1]}"   ==  "- [] Task two."    ]]
  [[    "${lines[2]}"   ==  "- [ ] Task four."  ]]
}

@test "'todos tasks closed <folder>/<id>' exits with 0 and lists closed tasks." {
  {
    "${_NB}" init

    "${_NB}" add                                    \
      --filename "Example Folder/Todo One.todo.md"  \
      --content "$(cat <<HEREDOC
# [ ] Example todo description one.

## Due

2200-02-02

## Tasks

- [ ] Task one.
- [] Task two.
- [x] Task three.
- [ ] Task four.

## Tags

#tag1 #tag2
HEREDOC
)"
  }

  run "${_NB}" todos tasks closed Example\ Folder/1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[    "${status}"     -eq 0                   ]]
  [[    "${#lines[@]}"  -eq 1                   ]]

  [[    "${lines[0]}"   ==  "- [x] Task three." ]]
}

@test "'todos tasks <folder>/<id>' exits with 0 and lists tasks." {
  {
    "${_NB}" init

    "${_NB}" add                                    \
      --filename "Example Folder/Todo One.todo.md"  \
      --content "$(cat <<HEREDOC
# [ ] Example todo description one.

## Due

2200-02-02

## Tasks

- [ ] Task one.
- [] Task two.
- [x] Task three.
- [ ] Task four.

## Tags

#tag1 #tag2
HEREDOC
)"
  }

  run "${_NB}" todos tasks Example\ Folder/1

  printf "\${status}: '%s'\\n" "${status}"
  printf "\${output}: '%s'\\n" "${output}"

  [[    "${status}"     -eq 0                   ]]
  [[    "${#lines[@]}"  -eq 4                   ]]

  [[    "${lines[0]}"   ==  "- [ ] Task one."   ]]
  [[    "${lines[1]}"   ==  "- [] Task two."    ]]
  [[    "${lines[2]}"   ==  "- [x] Task three." ]]
  [[    "${lines[3]}"   ==  "- [ ] Task four."  ]]
}
