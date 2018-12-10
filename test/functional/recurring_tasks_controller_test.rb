require File.expand_path('../../test_helper', __FILE__)

class RecurringTasksControllerTest < ActionController::TestCase
  fixtures :projects,
           :users,
           :roles,
           :members,
           :member_roles,
           :trackers,
           :projects_trackers,
           :issue_statuses,
           :issues

  def setup
    Role.find(1).add_permission! :manage_schedule
    Role.find(1).add_permission! :view_schedule
    Project.find(1).enable_module!(:redmine_recurring_tasks)
  end

  def test_new
    @request.session[:user_id] = 2

    with_settings default_language: 'en' do
      get :new, params: { issue_id: 1 }

      assert_response :success
      assert_template 'new'
    end
  end

  def test_new_wrong_issue
    @request.session[:user_id] = 2

    with_settings default_language: 'en' do
      get :new, params: { issue_id: 666 }
      assert_response :not_found
    end
  end

  def test_new_empty_issue
    @request.session[:user_id] = 2

    with_settings default_language: 'en' do
      get :new
      assert_response :not_found
    end
  end
end
