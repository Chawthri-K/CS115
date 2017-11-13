;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 06, Problem 3
;; ***************************************************
;;

(define-struct fullname (first last))
;; A Fullname is a (make-fullname Str Str)

(define-struct student (id name grades))
;; A Student is a (make-student Nat Fullname (listof Num))
;; requires:
;;   id is a unique natural number representing the student id
;;   name is the fullname of the student
;;   grades is a list of student grades between 0 and 100 inclusive

(define st1 (make-student 1 (make-fullname "Joe" "Trudeau")
                          (list 100 93.2 71.4 84.6 78.45)))
(define st2 (make-student 2 (make-fullname "Keaton" "Abass")
                          (list 50 60 43 22.5 32.8)))
(define st3 (make-student 3 (make-fullname "Tolu" "Mandela")
                          (list 50 60 70 80 62 51 40)))
(define st4 (make-student 4 (make-fullname "Xi" "Mandela")
                          (list 2.5 5.5)))
(define st5 (make-student 5 (make-fullname "Gupta" "Merkel")
                          (list 65 62.5 69.3 88.54 61.2 54 74.3)))
(define st6 (make-student 6 (make-fullname "Tolu" "Mandela")
                          (list 88.5 99.8)))

;;(num-grades) produces the number of grades a student has
;; (list of int) ---> Nat
;;Example
(check-expect (num-grades (student-grades st1)) 5)

(define (num-grades grades)
  (cond [(empty? grades) 0]
        [else (+ 1 (num-grades (rest grades)))]))

;;(sum-avg grades) produces the sum of the grades a student has
;; (list of int) ---> Nat
;;Example
(check-expect (sum-avg (student-grades st1)) 427.65)

(define (sum-avg grades)
  (cond [(empty? grades) 0]
        [else (+ (first grades)
                 (sum-avg (rest grades)))]))

;;(st-avg grades) produces the average of a students grades
;;(list of Int) ---> Nat
(check-expect (st-avg (student-grades st1)) 85.53)

(define (st-avg grades)
  (/ (sum-avg grades)
     (cond [(empty? grades) 1]
           [else (num-grades grades)])))

;;(select-students los num1 num2) produces the student ids of the students that attained an average
;;within a certain range
;;Example
(check-expect (select-students (list st1 st2 st3 st4 st5) 80 50) (list 3 5))

(define (select-students los num1 num2)
  (cond [(empty? los) empty]
        [(and (> num1 num2) (> num1 (st-avg (student-grades (first los))) num2))
         (cons (student-id (first los)) (select-students (rest los) num1 num2))]
        [(and (< num1 num2) (< num1 (st-avg (student-grades (first los))) num2))
         (cons (student-id (first los)) (select-students (rest los) num1 num2))]
        [else (select-students (rest los) num1 num2)]))

;;Tests
(check-expect (select-students (list st1 st2 st3 st4 st5) 80 50) (list 3 5))
(check-expect (select-students (list st1 st2 st3 st4 st5) 50 80) (list 3 5))
(check-expect (select-students (list st5 st4 st3 st2 st1) 80 50) (list 5 3))
(check-expect (select-students (list st1 st2 st3 st4 st5) 0 100) (list 1 2 3 4 5))
(check-expect (select-students (list st1 st2 st3 st4 st5) 0 0) empty)
(check-expect (select-students (list st5 st4 st3 st2 st1) 100 100) empty)
(check-expect (select-students (list st1) 80 100) (list 1))
(check-expect (select-students (list st2) 30 50) (list 2))
(check-expect (select-students (list st3) 50 70) (list 3))
(check-expect (select-students (list st4) 0 10) (list 4))
(check-expect (select-students (list st5) 80 60) (list 5))
(check-expect (select-students (list st6) 80 100) (list 6))
