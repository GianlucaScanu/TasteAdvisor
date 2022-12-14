class OmniUsersController < ApplicationController

  private
    # Only allow a list of trusted parameters through.
    def omni_user_params
      params.require(:omni_user).permit(:calling_path)
    end
end
