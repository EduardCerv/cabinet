class DocsController < ApplicationController
    #excete find_doc function just for the specific actions
    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Doc.all.order("created_at DESC")
    end

    def show
    end
    #shows the page where you can create a Doc
    def new
        @doc = current_user.docs.build
    end
    #This action create the Doc and return to respective template
    def create
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end
    #just display the information in a haml file, not update the doc
    def edit
    end
    #udpate the doc in the backend
    def update
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end

    def destroy
        if @doc.destroy
            redirect_to docs_path
        else
            render 'edit'
        end
    end

    private

        def find_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :body)
        end
end
