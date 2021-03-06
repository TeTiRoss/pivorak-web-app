# frozen_string_literal: true

module Courses
  class Student < ApplicationRecord
    class TotalHash < ApplicationService
      TOTAL   = 'total'
      NAME    = 'name'
      LECTURE = 'lecture'

      def initialize(students, sort_by: nil, lecture_id: nil)
        @students   = students
        @sort_by    = sort_by
        @lecture_id = lecture_id
      end

      def call
        sorted_hash
      end

      private

      attr_reader :students, :sort_by, :lecture_id

      def per_lecture(student)
        student.progresses
      end

      def total(student)
        ::Courses::Journal::Total.call(student)
      end

      def total_hash
        students.each_with_object({}) do |student, total_hash|
          progress = { per_lecture: per_lecture(student), total: total(student) }
          total_hash[student] = progress
        end
      end

      def sorted_hash # rubocop:disable Metrics/AbcSize
        case sort_by
        when TOTAL
          total_hash.sort_by { |_k, v| v[:total] }.reverse.to_h
        when NAME
          total_hash.sort_by { |k, _v| k.full_name }.to_h
        when LECTURE
          total_hash.sort_by do |_k, v|
            v[:per_lecture]
              .find_by(lecture_id: lecture_id)
              .homework_mark
          end.reverse.to_h
        else
          total_hash.sort_by { |k, _v| k.full_name }.to_h
        end
      end
    end
  end
end
