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
        @doc = Doc.new
    end
    #This action create the Doc and return to respective template
    def create
        @doc = Doc.new(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

        def find_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :body)
        end
end
