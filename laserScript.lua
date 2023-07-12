function PlayFestival(FestivalToPlay)
	local FestivalToPlay = script.Parent.FestivalPresets[FestivalToPlay]
	local Nodes = FestivalToPlay.LightingNodes
	local Music = FestivalToPlay.Music
	local Lasers = script.Parent.Lasers
	local Emitters = script.Parent.Emitters
	Music:Play()
	for NodeIndex = 1,#Nodes:GetChildren() do
		local CurrentNode = Nodes:FindFirstChild("Node_"..NodeIndex.."")
		if CurrentNode:FindFirstChild("Repeat") then
			for i = 1,CurrentNode.Repeat.Value do
				for NodeNumber = 1,#CurrentNode.Nodes:GetChildren() do
					for Index,LaserObject in pairs(CurrentNode.Nodes[tostring("Node_"..NodeNumber.."")]:GetChildren()) do
						if LaserObject:IsA("Folder") and string.sub(LaserObject.Name,1,4) == "Ball" then
							for Index,Laser in pairs(LaserObject.TurnOff:GetChildren()) do
								if Emitters[LaserObject.Name].Laser:FindFirstChild(Laser.Name) then
									Emitters[LaserObject.Name].Laser[Laser.Name]:Destroy()
								end
							end		
							Emitters[LaserObject.Name].Laser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(LaserObject.Rotation.Value.X),math.rad(LaserObject.Rotation.Value.Y),math.rad(LaserObject.Rotation.Value.Z)))
							for Index,Laser in pairs(LaserObject.TurnOn:GetChildren()) do
								local NewLaser = Lasers.BallLaser:Clone()
								NewLaser.Name = Laser.Name
								NewLaser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(Laser.Value.X),math.rad(Laser.Value.Y),math.rad(Laser.Value.Z)))
								NewLaser.Laser.Color = Laser.Color.Value
								NewLaser.Parent = Emitters[LaserObject.Name].Laser
								NewLaser.Laser.Transparency = 0
							end
						end
						if LaserObject:IsA("Folder") and string.sub(LaserObject.Name,1,6) == "Beamer" then
							for Index,Laser in pairs(LaserObject.TurnOff:GetChildren()) do
								if Emitters[LaserObject.Name].Laser:FindFirstChild(Laser.Name) then
									Emitters[LaserObject.Name].Laser[Laser.Name]:Destroy()
								end
							end		
							Emitters[LaserObject.Name].Laser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(LaserObject.Rotation.Value.X),math.rad(LaserObject.Rotation.Value.Y),math.rad(LaserObject.Rotation.Value.Z)))
							for Index,Laser in pairs(LaserObject.TurnOn:GetChildren()) do
								local NewLaser = Lasers.BeamerLaser:Clone()
								NewLaser.Name = Laser.Name
								NewLaser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(Laser.Value.X),math.rad(Laser.Value.Y),math.rad(Laser.Value.Z)))
								NewLaser.Laser.Color = Laser.Color.Value
								NewLaser.Parent = Emitters[LaserObject.Name].Laser
								NewLaser.Laser.Transparency = 0.75
							end
						end
					end
					wait(CurrentNode.Nodes[tostring("Node_"..NodeNumber.."")].Duration.Value)
				end
			end
		else
			for Index,LaserObject in pairs(CurrentNode:GetChildren()) do
				if LaserObject:IsA("Folder") and string.sub(LaserObject.Name,1,4) == "Ball" then
					for Index,Laser in pairs(LaserObject.TurnOff:GetChildren()) do
						if Emitters[LaserObject.Name].Laser:FindFirstChild(Laser.Name) then
							Emitters[LaserObject.Name].Laser[Laser.Name]:Destroy()
						end
					end		
					Emitters[LaserObject.Name].Laser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(LaserObject.Rotation.Value.X),math.rad(LaserObject.Rotation.Value.Y),math.rad(LaserObject.Rotation.Value.Z)))
					for Index,Laser in pairs(LaserObject.TurnOn:GetChildren()) do
						local NewLaser = Lasers.BallLaser:Clone()
						NewLaser.Name = Laser.Name
						NewLaser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(Laser.Value.X),math.rad(Laser.Value.Y),math.rad(Laser.Value.Z)))
						NewLaser.Laser.Color = Laser.Color.Value
						NewLaser.Parent = Emitters[LaserObject.Name].Laser
						NewLaser.Laser.Transparency = 0
					end
				end
				if LaserObject:IsA("Folder") and string.sub(LaserObject.Name,1,6) == "Beamer" then
					for Index,Laser in pairs(LaserObject.TurnOff:GetChildren()) do
						if Emitters[LaserObject.Name].Laser:FindFirstChild(Laser.Name) then
							Emitters[LaserObject.Name].Laser[Laser.Name]:Destroy()
						end
					end		
					Emitters[LaserObject.Name].Laser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(LaserObject.Rotation.Value.X),math.rad(LaserObject.Rotation.Value.Y),math.rad(LaserObject.Rotation.Value.Z)))
					for Index,Laser in pairs(LaserObject.TurnOn:GetChildren()) do
						local NewLaser = Lasers.BeamerLaser:Clone()
						NewLaser.Name = Laser.Name
						NewLaser:SetPrimaryPartCFrame(Emitters[LaserObject.Name].Laser.Core.CFrame * CFrame.Angles(math.rad(Laser.Value.X),math.rad(Laser.Value.Y),math.rad(Laser.Value.Z)))
						NewLaser.Laser.Color = Laser.Color.Value
						NewLaser.Parent = Emitters[LaserObject.Name].Laser
						NewLaser.Laser.Transparency = 0.75
					end
				end
			end
		end
		wait(CurrentNode.Duration.Value)
	end
	for Index,Laser in pairs(Emitters:GetDescendants()) do
		if Laser:FindFirstChild("EmitterPart") then
			Laser:Destroy()
		end
		wait()
	end
end
