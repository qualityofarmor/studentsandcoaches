# Code Exercise
> When done correctly, this code exercise has been known to
> show significant positive results in the prevention and
> recession of the affliction known as "unemployment".

Requirements (paraphrased):
* There's two main models here, Coaches and Students.
* A coach can be assigned several students.
* We're talkin' about several coaches and each must be capable of managing
  several students. In the interest of work/life balance, that student list must
  be distributed evenly between the coaching staff.
* The distribution is dependent on the size of each Coach's current student pool
  and the coaches with the least amount of students are the first to be assigned
  students.

### Problem #1
Evenly assign a group of students to their respective coaches.

### Problem #2
Evenly assign a group of students to their respective coaches regardless of each coach's existing student count.

### Problem #3
Evenly assign a group of students to their respective coaches based on a coach's predetermined workload ratio.


## Make it work
his was built using ruby 2.1.5
1.  bundle install  
2.  You can run tests using:
3.  It'll be using a sqlite database located at db/studentsandcoaches.db
4.  This code exercise uses Rspec for tests. Run some tests..I insist.  Here's how:


      $ rspec

alternatively..you can run single verbose tests with:

    $ rspec spec/coach_spec.rb --format documentation
