require 'spec_helper'
require_relative 'activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
  end

  describe 'initialize' do
    it 'exists and has attributes' do
      expect(@activity).to be_an_instance_of(Activity)
    end
  end

  describe 'add_participant' do
    it 'can add a participant with a cost' do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
    end

    it 'can add multiple participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end
  end

  describe 'total_cost' do
    it 'calculates the total cost of all participants' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.total_cost).to eq(60)
    end
  end

  describe 'split' do
    it 'calculates the cost per person' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.split).to eq(30)
    end
  end

  describe 'owed' do
    it 'calculates the amount owed by each participant' do
      @activity.add_participant("Maria", 20)
    
