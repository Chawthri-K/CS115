;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; Chawthri Kanagarasa (20724188)
;; CS 115 Fall 2017
;; Assignment 02, Problem 3
;; ***************************************************
;;

;;HELPER FUNCTION:(beg>s s beg) If string length of beg is longer than
;;string length is greater than s, this function will default string-length to s
;;to prevent an error
;;beg>s Str Str ---> Nat
;;Examples
(check-expect (beg>s "Hello" "Friday") 5)
(check-expect (beg>s "Hello" "Go") 2)

(define (beg>s s beg)
  (min (string-length beg) (string-length s)))


;;(overwrite s beg end): takes the a string s and replaces the front
;;and end with new strings beg and end.
;;If the sum of the characters of beg and end is greater
;;than the sum of characters in string s, the beg and end are
;;appended together.
;;overwrite: Str Str Str ---> Str
;;Examples
(check-expect (overwrite "catapult" "dog" "go") "dogapugo")
(check-expect (overwrite "hello" "fire" "truck") "firetruck")

(define (overwrite s beg end)
  (string-append beg
                 (substring s
                            (beg>s s beg)
                            (max (beg>s s beg) (- (string-length s) (string-length end))))
                 end))


;;Tests
(check-expect (beg>s "Tin" "Alley") 3)
(check-expect (beg>s "Diamond" "No") 2)
(check-expect (overwrite "freelance" "crane" "no") "craneanno")
(check-expect (overwrite "night" "check-" "expect") "check-expect")
(check-expect (overwrite "Yes" "Hi" "Friday") "HiFriday")
(check-expect (overwrite "No" "Friday" "Sunday") "FridaySunday")