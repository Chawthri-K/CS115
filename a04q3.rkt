;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 04, Problem 3
;; ***************************************************
;;

(define-struct triangle (equality sharpness a1 a2 a3))
;; A Triangle is a (make-triangle Sym Sym Num Num Num)
;; Requires:
;;   equality is 'equilateral, 'isosceles, or 'scalene
;;   sharpness is 'acute, 'obtuse, or 'right
;;   the sum of a1, a2, and a3 is 180.
;;   a1, a2, and a3 are all > 0.

;;(a3 a1 a2) produces the third angle a3 given the other two angles of
;;      the triangle.
;;a3: Int Int ---> Int
;;requires: a1, a2 to be >= 0
;;          a1 + a2 < 180
;;Example:
(check-expect (a3 60 60) 60)

(define (a3 a1 a2) (- 180 a2 a1))

;;(equality a1 a2 a3) produces the type of triangle it is
;;      equilateral, isosceles or scalene and outputs it as
;;      a symbol.
;;equality: Int Int Int ---> (anyof 'equilateral, 'isosceles or 'scalene)
;;requires: a1, a2 and a3 >= 0
;;          a1 + a2 + a3 = 180
;;Example:
(check-expect (equality 60 60 60) 'equilateral)

(define (equality a1 a2 a3)
  (cond [(= a1 a2 a3) 'equilateral]
        [(= a1 a2) 'isosceles]
        [(= a1 a3) 'isosceles]
        [(= a2 a3) 'isosceles]
        [else 'scalene]))

;;(sharpness a1 a2 a3) produces the type of triangle it is
;;      right angle, acute angle or obtuse angle and outputs it as
;;      a symbol.
;;sharpness: Int Int Int ---> (anyof 'right, 'acute or 'obtuse)
;;requires: a1, a2 and a3 >= 0
;;          a1 + a2 + a3 = 180
;;Example:
(check-expect (sharpness 90 45 45) 'right)

(define (sharpness a1 a2 a3)
  (cond [(or (< 90 a1) (< 90 a2) (< 90 a3)) 'obtuse]
        [(or (= 90 a1) (= 90 a2) (= 90 a3)) 'right]
        [(and (> 90 a1) (> 90 a2) (> 90 a3)) 'acute]))


;;(complete-triangle a1 a2) produces the third remaining angle as well as the
;;      properties of the triangle given 2 angles.
;;a3: Int Int ---> triangle
;;requires: a1, a2 to be >= 0
;;          a1 + a2 < 180
;;Example:
(check-expect (complete-triangle 60 60) (make-triangle 'equilateral 'acute 60 60 60))

(define (complete-triangle a1 a2)
  (make-triangle (equality a1 a2 (a3 a1 a2)) (sharpness a1 a2 (a3 a1 a2)) a1 a2 (a3 a1 a2)
   ))

;;Tests:
(check-expect (a3 60 60) 60)
(check-expect (a3 45 90) 45)
(check-expect (a3 50 60) 70)
(check-expect (equality 60 60 60) 'equilateral)
(check-expect (equality 45 90 45) 'isosceles)
(check-expect (equality 90 45 45) 'isosceles)
(check-expect (equality 45 45 90) 'isosceles)
(check-expect (equality 50 60 70) 'scalene)
(check-expect (sharpness 90 45 45) 'right)
(check-expect (sharpness 130 20 30) 'obtuse)
(check-expect (sharpness 60 60 60) 'acute)
(check-expect (complete-triangle 50 60) (make-triangle 'scalene 'acute 50 60 70))
(check-expect (complete-triangle 50 90) (make-triangle 'scalene 'right 50 90 40))
(check-expect (complete-triangle 130 20) (make-triangle 'scalene 'obtuse 130 20 30))
(check-expect (complete-triangle 50 50) (make-triangle 'isosceles 'acute 50 50 80))
(check-expect (complete-triangle 45 90) (make-triangle 'isosceles 'right 45 90 45))
(check-expect (complete-triangle 130 25) (make-triangle 'isosceles 'obtuse 130 25 25))
(check-expect (complete-triangle 60 60) (make-triangle 'equilateral 'acute 60 60 60))
;;It is impossible for the triangle to be equilateral while being an obtuse
;;or right angle triangle.
