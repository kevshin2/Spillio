class StudentsController < AuthenticatedController


  def new
    @student = Student.new
    @view_only = false
    render :profile
  end

  def show
    @student = Student.find(params[:id])
    @view_only = true
    render :profile
  end

  def self.cid_exists? cid
    Student.find_by_cid(cid)!=nil
  end

  # Finds the student with Calnet Id number
  def show_by_cid
    @student = Student.find_by_cid(params[:id])

    if @student
      @view_only = true
      render :profile
    else
      redirect_to students_new_path
    end
  end

  # TODO: Form validation!!
  def create
  	s = params[:student]
    # Remove empty skill and course ids, cause they appear for
    # some weird and unknown reason
    if s.has_key? :skill_ids
      s[:skill_ids] = s[:skill_ids].select { |sk| not sk.empty?}
      puts s[:skill_ids].size
    end

    if s.has_key? :course_ids
      s[:course_ids] = s[:course_ids].select { |c| not c.empty?}
    end

    student_cid = LoginController.get_cid

  	@student = Student.create(:name => s[:name], :about => s[:about],
  		:interest => s[:interest], :cid => student_cid)
  	@student.section = Section.find(s[:section_id])
 	  @student.skills << Skill.find(s[:skill_ids])
  	@student.courses << Course.find(s[:course_ids])
  	@student.save
    @view_only = true
    redirect_to "/students/#{@student.id}"
  end

  def search
    name_query = params[:query] || ""
    page = params[:page] || 1

    # TODO: if other settings, filter by them

    # Construct sql query
    num_pages, sql_query = Student.search_by_name(name_query, page)

    # Flash variables
    flash[:query] = name_query

    # View variables
    @students = sql_query
    @page = page
    @any_results = @students.any?
    @num_pages = num_pages
  end
end
