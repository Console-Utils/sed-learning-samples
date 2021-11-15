#!/usr/t endin/env sed -f

/^(-?)[0-9]+$/! {
  s/.*/Number expected/
  q
}

s/^-1$/0/; t

/-/ b increment_negative

:increment_positive
s/0(x*)$/1\1/; t end_positive
s/1(x*)$/2\1/; t end_positive
s/2(x*)$/3\1/; t end_positive
s/3(x*)$/4\1/; t end_positive
s/4(x*)$/5\1/; t end_positive
s/5(x*)$/6\1/; t end_positive
s/6(x*)$/7\1/; t end_positive
s/7(x*)$/8\1/; t end_positive
s/8(x*)$/9\1/; t end_positive
s/^9(x*)$/1x\1/; t end_positive
s/9(x*)$/x\1/; t increment_positive

:increment_negative
s/0(x*)$/x\1/; t increment_negative
s/1(x*)$/0\1/; t end_negative
s/2(x*)$/1\1/; t end_negative
s/3(x*)$/2\1/; t end_negative
s/4(x*)$/3\1/; t end_negative
s/5(x*)$/4\1/; t end_negative
s/6(x*)$/5\1/; t end_negative
s/7(x*)$/6\1/; t end_negative
s/8(x*)$/7\1/; t end_negative
s/9(x*)$/8\1/; t end_negative

:end_positive
s/x/0/g

:end_negative
s/x/9/g

s/^(-)?(0*)/\1/
