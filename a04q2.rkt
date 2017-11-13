;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 04, Problem 2
;; ***************************************************
;;

(define-struct triangle (equality sharpness a1 a2 a3))
;; A Triangle is a (make-triangle Sym Sym Num Num Num)
;; Requires:
;;   equality is 'equilateral, 'isosceles, or 'scalene
;;   sharpness is 'acute, 'obtuse, or 'right
;;   the sum of a1, a2, and a3 is 180.
;;   a1, a2, and a3 are all > 0.

;;my-triangle-fun: traingle ---> (anyof Str Int)
;;requires: equality must be (anyof 'equilateral, 'isosceles, or 'scalene)
;;          sharpness must be (anyof 'acute, 'obtuse, or 'right)
;;          a1, a2, and a3 are all > 0  and sum to exactly 180.
;;(define (my-trinagle-fun info)
;;...(mytriangle-equality info)...
;;...(mytriangle-sharpness info)...
;;...(mytriangle-a1 info)...
;;...(mytriangle-a2 info)...
;;...(mytriangle-a3 info)...)