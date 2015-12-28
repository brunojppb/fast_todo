require 'rails_helper'

RSpec.describe Api::V1::TodosController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create :user
    @device = FactoryGirl.create :device, user: @user
    request.headers['Accept'] = "application/vnd.fasttodo.v1"
    request.headers['Authorization'] = @device.auth_token
  end

  describe "when GET #index" do
    before(:each) do
      @todos = []
      10.times { @todos << @user.todos.create(FactoryGirl.attributes_for(:todo)) }
      get :index
    end

    it "should return 10 todo items" do
      todos_response = JSON.parse(response.body, symbolize_names: true)
      expect(todos_response[:todos].length).to eql 10
    end
    it { should respond_with 200 }
  end

  describe "when GET #show" do
    before(:each) do
      @todo = FactoryGirl.create :todo, user: @user
      get :show, id: @todo.id
    end

    it "should return the tudo" do
      todo_response = JSON.parse(response.body, symbolize_names: true)
      expect(todo_response[:title]).to eql @todo.title
    end
    it { should respond_with 200 }
  end

  describe "when POST #create" do
    context "when todo item is successfully created" do
      before(:each) do
        @todo_attrs = FactoryGirl.attributes_for :todo
        post :create, { todo: @todo_attrs }, format: :json
      end

      it "should return the new todo item just created" do
        todo_response = JSON.parse(response.body, symbolize_names: true)
        expect(todo_response[:title]).to eql @todo_attrs[:title]
      end
      it { should respond_with 201 }
    end

    context "when todo item is not created" do
      before(:each) do
        post :create, { todo: { body: 'no title' } }, format: :json
      end

      it "should return the errors" do
        todo_response = JSON.parse(response.body, symbolize_names: true)
        expect(todo_response[:errors][:title]).to include "can't be blank"
      end
      it { should respond_with 422 }
    end
  end

  describe "when PUT/PATCH #update" do
    context "when todo item is successfully updated" do
      before(:each) do
        @todo = FactoryGirl.create :todo, user: @user
        put :update, { id: @todo.id, todo: { title: "new title" } }, format: :json
      end

      it "should return the updated todo" do
        todo_response = JSON.parse(response.body, symbolize_names: true)
        expect(todo_response[:title]).to eql "new title"
      end
      it { should respond_with 200 }
    end

    context "when todo item is not updated" do
      before(:each) do
        @todo = FactoryGirl.create :todo, user: @user
        put :update, { id: @todo.id, todo: { title: "" } }, format: :json
      end

      it "should return the errors" do
        todo_response = JSON.parse(response.body, symbolize_names: true)
        expect(todo_response[:errors][:title]).to include "can't be blank"
      end
      it { should respond_with 422 }
    end
  end

  describe "when DELETE #destroy" do
    before(:each) do
      @todo = FactoryGirl.create :todo, user: @user
      delete :destroy, id: @todo.id
    end

    it { should respond_with 204 }
  end

end
