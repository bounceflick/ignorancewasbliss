require 'spec_helper'

describe Task do
  describe "create a task w/ the correct schema" do
    before(:all) do
      raise RuntimeError, "be sure to run rake db:migrate before running the specs" unless ActiveRecord::Migrator.current_version > 0
    end

    it "has a tasks table" do
      expect(ActiveRecord::Base.connection.table_exists?(:tasks)).to be_truthy
    end

  end
  #pending "add some examples to (or delete) #{__FILE__}"
end

